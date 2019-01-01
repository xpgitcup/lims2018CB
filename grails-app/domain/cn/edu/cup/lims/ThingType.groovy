package cn.edu.cup.lims

class ThingType {

    String name
    ThingType upType

    static hasMany = [subType: ThingType, things: Thing]

    static constraints = {
        name(unique: true)
        upType(nullable: true)
    }

    String toString() {
        return "${name}"
    }
}
