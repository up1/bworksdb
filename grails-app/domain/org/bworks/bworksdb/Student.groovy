package org.bworks.bworksdb

class Student {
    
    String firstName
    String lastName
    String middleName
    Date birthDate
    String gender
    static belongsTo = [Contact]
    
    static constraints = {
    }
}
