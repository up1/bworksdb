

package org.bworks.bworksdb

class EnrollmentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ enrollmentInstanceList: Enrollment.list( params ), enrollmentInstanceTotal: Enrollment.count() ]
    }

    def show = {
        def enrollmentInstance = Enrollment.get( params.id )

        if(!enrollmentInstance) {
            flash.message = "Enrollment not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ enrollmentInstance : enrollmentInstance ] }
    }

    def delete = {
        def enrollmentInstance = Enrollment.get( params.id )
        if(enrollmentInstance) {
            try {
                enrollmentInstance.delete(flush:true)
                flash.message = "Enrollment ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Enrollment ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Enrollment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def enrollmentInstance = Enrollment.get( params.id )

        if(!enrollmentInstance) {
            flash.message = "Enrollment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ enrollmentInstance : enrollmentInstance ]
        }
    }

    def update = {
        def enrollmentInstance = Enrollment.get( params.id )
        if(enrollmentInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(enrollmentInstance.version > version) {
                    
                    enrollmentInstance.errors.rejectValue("version", "enrollment.optimistic.locking.failure", "Another user has updated this Enrollment while you were editing.")
                    render(view:'edit',model:[enrollmentInstance:enrollmentInstance])
                    return
                }
            }
            enrollmentInstance.properties = params
            if(!enrollmentInstance.hasErrors() && enrollmentInstance.save()) {
                flash.message = "Enrollment ${params.id} updated"
                redirect(action:show,id:enrollmentInstance.id)
            }
            else {
                render(view:'edit',model:[enrollmentInstance:enrollmentInstance])
            }
        }
        else {
            flash.message = "Enrollment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def enrollmentInstance = new Enrollment()
        enrollmentInstance.properties = params
        return ['enrollmentInstance':enrollmentInstance]
    }

    def save = {
        def enrollmentInstance = new Enrollment(params)
        if(!enrollmentInstance.hasErrors() && enrollmentInstance.save()) {
            flash.message = "Enrollment ${enrollmentInstance.id} created"
            redirect(action:show,id:enrollmentInstance.id)
        }
        else {
            render(view:'create',model:[enrollmentInstance:enrollmentInstance])
        }
    }
}
