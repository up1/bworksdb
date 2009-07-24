

package org.bworks.bworksdb

class InterestController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ interestInstanceList: Interest.list( params ), interestInstanceTotal: Interest.count() ]
    }

    def show = {
        def interestInstance = Interest.get( params.id )

        if(!interestInstance) {
            flash.message = "Interest not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ interestInstance : interestInstance ] }
    }

    def delete = {
        def interestInstance = Interest.get( params.id )
        if(interestInstance) {
            try {
                interestInstance.delete(flush:true)
                flash.message = "Interest ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Interest ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Interest not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def interestInstance = Interest.get( params.id )

        if(!interestInstance) {
            flash.message = "Interest not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ interestInstance : interestInstance ]
        }
    }

    def update = {
        def interestInstance = Interest.get( params.id )
        if(interestInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(interestInstance.version > version) {
                    
                    interestInstance.errors.rejectValue("version", "interest.optimistic.locking.failure", "Another user has updated this Interest while you were editing.")
                    render(view:'edit',model:[interestInstance:interestInstance])
                    return
                }
            }
            interestInstance.properties = params
            if(!interestInstance.hasErrors() && interestInstance.save()) {
                flash.message = "Interest ${params.id} updated"
                redirect(action:show,id:interestInstance.id)
            }
            else {
                render(view:'edit',model:[interestInstance:interestInstance])
            }
        }
        else {
            flash.message = "Interest not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def interestInstance = new Interest()
        interestInstance.properties = params
        return ['interestInstance':interestInstance]
    }

    def save = {
        def interestInstance = new Interest(params)
        if(!interestInstance.hasErrors() && interestInstance.save()) {
            flash.message = "Interest ${interestInstance.id} created"
            redirect(action:show,id:interestInstance.id)
        }
        else {
            render(view:'create',model:[interestInstance:interestInstance])
        }
    }
}
