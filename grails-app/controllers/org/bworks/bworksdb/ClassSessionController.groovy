

package org.bworks.bworksdb

class ClassSessionController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ classSessionInstanceList: ClassSession.list( params ), classSessionInstanceTotal: ClassSession.count() ]
    }

    def show = {
        def classSessionInstance = ClassSession.get( params.id )

        if(!classSessionInstance) {
            flash.message = "ClassSession not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ classSessionInstance : classSessionInstance ] }
    }

    def delete = {
        def classSessionInstance = ClassSession.get( params.id )
        if(classSessionInstance) {
            try {
                classSessionInstance.delete(flush:true)
                flash.message = "ClassSession ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "ClassSession ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "ClassSession not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def classSessionInstance = ClassSession.get( params.id )

        if(!classSessionInstance) {
            flash.message = "ClassSession not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ classSessionInstance : classSessionInstance ]
        }
    }

    def update = {
        def classSessionInstance = ClassSession.get( params.id )
        if(classSessionInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(classSessionInstance.version > version) {
                    
                    classSessionInstance.errors.rejectValue("version", "classSession.optimistic.locking.failure", "Another user has updated this ClassSession while you were editing.")
                    render(view:'edit',model:[classSessionInstance:classSessionInstance])
                    return
                }
            }
            classSessionInstance.properties = params
            if(!classSessionInstance.hasErrors() && classSessionInstance.save()) {
                flash.message = "ClassSession ${params.id} updated"
                redirect(action:show,id:classSessionInstance.id)
            }
            else {
                render(view:'edit',model:[classSessionInstance:classSessionInstance])
            }
        }
        else {
            flash.message = "ClassSession not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def classSessionInstance = new ClassSession()
        classSessionInstance.properties = params
        return ['classSessionInstance':classSessionInstance]
    }

    def save = {
        def classSessionInstance = new ClassSession(params)
        if(!classSessionInstance.hasErrors() && classSessionInstance.save()) {
            flash.message = "ClassSession ${classSessionInstance.id} created"
            redirect(action:show,id:classSessionInstance.id)
        }
        else {
            render(view:'create',model:[classSessionInstance:classSessionInstance])
        }
    }
}
