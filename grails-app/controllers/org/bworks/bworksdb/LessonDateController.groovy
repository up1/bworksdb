

package org.bworks.bworksdb

class LessonDateController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ lessonDateInstanceList: LessonDate.list( params ), lessonDateInstanceTotal: LessonDate.count() ]
    }

    def show = {
        def lessonDateInstance = LessonDate.get( params.id )

        if(!lessonDateInstance) {
            flash.message = "LessonDate not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ lessonDateInstance : lessonDateInstance ] }
    }

    def delete = {
        def lessonDateInstance = LessonDate.get( params.id )
        if(lessonDateInstance) {
            try {
                lessonDateInstance.delete(flush:true)
                flash.message = "LessonDate ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "LessonDate ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "LessonDate not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def lessonDateInstance = LessonDate.get( params.id )

        if(!lessonDateInstance) {
            flash.message = "LessonDate not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ lessonDateInstance : lessonDateInstance ]
        }
    }

    def update = {
        def lessonDateInstance = LessonDate.get( params.id )
        if(lessonDateInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(lessonDateInstance.version > version) {
                    
                    lessonDateInstance.errors.rejectValue("version", "lessonDate.optimistic.locking.failure", "Another user has updated this LessonDate while you were editing.")
                    render(view:'edit',model:[lessonDateInstance:lessonDateInstance])
                    return
                }
            }
            lessonDateInstance.properties = params
            if(!lessonDateInstance.hasErrors() && lessonDateInstance.save()) {
                flash.message = "LessonDate ${params.id} updated"
                redirect(action:show,id:lessonDateInstance.id)
            }
            else {
                render(view:'edit',model:[lessonDateInstance:lessonDateInstance])
            }
        }
        else {
            flash.message = "LessonDate not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def lessonDateInstance = new LessonDate()
        lessonDateInstance.properties = params
        return ['lessonDateInstance':lessonDateInstance]
    }

    def save = {
        def lessonDateInstance = new LessonDate(params)
        if(!lessonDateInstance.hasErrors() && lessonDateInstance.save()) {
            flash.message = "LessonDate ${lessonDateInstance.id} created"
            redirect(action:show,id:lessonDateInstance.id)
        }
        else {
            render(view:'create',model:[lessonDateInstance:lessonDateInstance])
        }
    }
}
