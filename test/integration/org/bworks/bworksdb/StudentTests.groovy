package org.bworks.bworksdb
import grails.test.*

import org.bworks.bworksdb.Student

class StudentTests extends GroovyTestCase {

    void testNotNullLastName() {
        def s = new Student(firstName:"Groovy in Action", lastName:"Foo")
        assertTrue s.validate()
    }
}
