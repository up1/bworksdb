package org.bworks.bworksdb

class Lesson {
    String name 
    String description
    Integer sequence
    static belongsTo = [Program]
    static hasMany = [lessonDates:LessonDate]
    static constraints = {
    }
}
