

package org.bworks.bworksdb

class NoteController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ noteInstanceList: Note.list( params ), noteInstanceTotal: Note.count() ]
    }

    def show = {
        def noteInstance = Note.get( params.id )

        if(!noteInstance) {
            flash.message = "Note not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ noteInstance : noteInstance ] }
    }

    def delete = {
        def noteInstance = Note.get( params.id )
        if(noteInstance) {
            try {
                noteInstance.delete(flush:true)
                flash.message = "Note ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Note ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Note not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def noteInstance = Note.get( params.id )

        if(!noteInstance) {
            flash.message = "Note not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ noteInstance : noteInstance ]
        }
    }

    def update = {
        def noteInstance = Note.get( params.id )
        if(noteInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(noteInstance.version > version) {
                    
                    noteInstance.errors.rejectValue("version", "note.optimistic.locking.failure", "Another user has updated this Note while you were editing.")
                    render(view:'edit',model:[noteInstance:noteInstance])
                    return
                }
            }
            noteInstance.properties = params
            if(!noteInstance.hasErrors() && noteInstance.save()) {
                flash.message = "Note ${params.id} updated"
                redirect(action:show,id:noteInstance.id)
            }
            else {
                render(view:'edit',model:[noteInstance:noteInstance])
            }
        }
        else {
            flash.message = "Note not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def noteInstance = new Note()
        noteInstance.properties = params
        return ['noteInstance':noteInstance]
    }

    def save = {
        def noteInstance = new Note(params)
        if(!noteInstance.hasErrors() && noteInstance.save()) {
            flash.message = "Note ${noteInstance.id} created"
            redirect(action:show,id:noteInstance.id)
        }
        else {
            render(view:'create',model:[noteInstance:noteInstance])
        }
    }
}
