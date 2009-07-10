package org.bworks.bworksdb

class Program {

    String name
    String description
    static hasMany = [ lessons:Lesson, classSessions:ClassSession, interests:Interest ]
    
    static constraints = {
    }
}
