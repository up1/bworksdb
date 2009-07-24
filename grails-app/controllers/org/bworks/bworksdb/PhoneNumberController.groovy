

package org.bworks.bworksdb

class PhoneNumberController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ phoneNumberInstanceList: PhoneNumber.list( params ), phoneNumberInstanceTotal: PhoneNumber.count() ]
    }

    def show = {
        def phoneNumberInstance = PhoneNumber.get( params.id )

        if(!phoneNumberInstance) {
            flash.message = "PhoneNumber not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ phoneNumberInstance : phoneNumberInstance ] }
    }

    def delete = {
        def phoneNumberInstance = PhoneNumber.get( params.id )
        if(phoneNumberInstance) {
            try {
                phoneNumberInstance.delete(flush:true)
                flash.message = "PhoneNumber ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "PhoneNumber ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "PhoneNumber not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def phoneNumberInstance = PhoneNumber.get( params.id )

        if(!phoneNumberInstance) {
            flash.message = "PhoneNumber not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ phoneNumberInstance : phoneNumberInstance ]
        }
    }

    def update = {
        def phoneNumberInstance = PhoneNumber.get( params.id )
        if(phoneNumberInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(phoneNumberInstance.version > version) {
                    
                    phoneNumberInstance.errors.rejectValue("version", "phoneNumber.optimistic.locking.failure", "Another user has updated this PhoneNumber while you were editing.")
                    render(view:'edit',model:[phoneNumberInstance:phoneNumberInstance])
                    return
                }
            }
            phoneNumberInstance.properties = params
            if(!phoneNumberInstance.hasErrors() && phoneNumberInstance.save()) {
                flash.message = "PhoneNumber ${params.id} updated"
                redirect(action:show,id:phoneNumberInstance.id)
            }
            else {
                render(view:'edit',model:[phoneNumberInstance:phoneNumberInstance])
            }
        }
        else {
            flash.message = "PhoneNumber not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def phoneNumberInstance = new PhoneNumber()
        phoneNumberInstance.properties = params
        return ['phoneNumberInstance':phoneNumberInstance]
    }

    def save = {
        def phoneNumberInstance = new PhoneNumber(params)
        if(!phoneNumberInstance.hasErrors() && phoneNumberInstance.save()) {
            flash.message = "PhoneNumber ${phoneNumberInstance.id} created"
            redirect(action:show,id:phoneNumberInstance.id)
        }
        else {
            render(view:'create',model:[phoneNumberInstance:phoneNumberInstance])
        }
    }
}
