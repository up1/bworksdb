

package org.bworks.bworksdb

class AttendanceController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ attendanceInstanceList: Attendance.list( params ), attendanceInstanceTotal: Attendance.count() ]
    }

    def show = {
        def attendanceInstance = Attendance.get( params.id )

        if(!attendanceInstance) {
            flash.message = "Attendance not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ attendanceInstance : attendanceInstance ] }
    }

    def delete = {
        def attendanceInstance = Attendance.get( params.id )
        if(attendanceInstance) {
            try {
                attendanceInstance.delete(flush:true)
                flash.message = "Attendance ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Attendance ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Attendance not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def attendanceInstance = Attendance.get( params.id )

        if(!attendanceInstance) {
            flash.message = "Attendance not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ attendanceInstance : attendanceInstance ]
        }
    }

    def update = {
        def attendanceInstance = Attendance.get( params.id )
        if(attendanceInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(attendanceInstance.version > version) {
                    
                    attendanceInstance.errors.rejectValue("version", "attendance.optimistic.locking.failure", "Another user has updated this Attendance while you were editing.")
                    render(view:'edit',model:[attendanceInstance:attendanceInstance])
                    return
                }
            }
            attendanceInstance.properties = params
            if(!attendanceInstance.hasErrors() && attendanceInstance.save()) {
                flash.message = "Attendance ${params.id} updated"
                redirect(action:show,id:attendanceInstance.id)
            }
            else {
                render(view:'edit',model:[attendanceInstance:attendanceInstance])
            }
        }
        else {
            flash.message = "Attendance not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def attendanceInstance = new Attendance()
        attendanceInstance.properties = params
        return ['attendanceInstance':attendanceInstance]
    }

    def save = {
        def attendanceInstance = new Attendance(params)
        if(!attendanceInstance.hasErrors() && attendanceInstance.save()) {
            flash.message = "Attendance ${attendanceInstance.id} created"
            redirect(action:show,id:attendanceInstance.id)
        }
        else {
            render(view:'create',model:[attendanceInstance:attendanceInstance])
        }
    }
}
