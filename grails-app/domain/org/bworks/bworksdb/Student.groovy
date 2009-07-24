package org.bworks.bworksdb

class Student {
    
    String firstName
    String lastName
    String middleName
    Date birthDate
    String gender
    Contact contact
    static belongsTo = [Contact]
    static hasMany = [ interests:Interest ]

    static constraints = {
        lastName(nullable:false, blank:false)
    }
    
    String toString(){
        return lastName + ', ' + firstName
    }
    
}
