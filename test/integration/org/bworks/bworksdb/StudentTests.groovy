package org.bworks.bworksdb
import grails.test.*

class StudentTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testNotNullLastName() {
        def s = new Student(firstName:"Groovy in Action")
        assertFalse s.validate()
    }
}
