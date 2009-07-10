package org.bworks.bworksdb

class Program {

    String name
    String description
    static hasMany = [lessons:Lessons,classSessions:ClassSessions,interests:Interests]
    
    static constraints = {
    }
}
