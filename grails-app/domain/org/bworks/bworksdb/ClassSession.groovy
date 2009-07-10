package org.bworks.bworksdb

class ClassSession {
    Date startDate
    Note note
    String name
    static belongsTo = [Program]
    static hasMany = [lessonDates:LessonDate,enrollments:Enrollment]
    static constraints = {
    }
}
