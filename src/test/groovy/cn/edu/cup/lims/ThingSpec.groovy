package cn.edu.cup.lims

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ThingSpec extends Specification implements DomainUnitTest<Thing> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
