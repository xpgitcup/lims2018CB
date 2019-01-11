package cn.edu.cup.lims

class ThingTypeCircle {

    String name
    ThingType thingType
    PersonTitle personTitle

    static constraints = {
        name(nullable: true)
        thingType()
        personTitle()
    }

    String toString() {
        return "${name}"
    }

    def beforeInsert() {
        name = "${thingType}-设置"
    }
}
