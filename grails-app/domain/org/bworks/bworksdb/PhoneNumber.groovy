package org.bworks.bworksdb

class PhoneNumber {

    String phoneNumber
    static belongsTo = [Contact]
    static constraints = {
        //phone(phoneNumber:true)
    }
}
