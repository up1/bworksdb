package org.bworks.bworksdb

class LessonDate {

    static belongsTo = [ClassSession,Lesson]
    static hasMany = [attendees:Attendance]
    Date lessonDate
    
    static constraints = {
    }
}
