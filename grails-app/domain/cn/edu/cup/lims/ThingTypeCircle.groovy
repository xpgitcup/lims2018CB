package cn.edu.cup.lims

class ThingTypeCircle {

    ThingType thingType
    PersonTitle personTitle

    static constraints = {
        thingType()
        personTitle()
    }

    String toString() {
        return "${id}.${thingType}-${personTitle}"
    }

}
