package cn.edu.cup.lims

class ThingType {

    String name
    ThingType upType
    PersonTitle relatedPersonTitle

    static hasMany = [subTypes: ThingType, things: Thing]

    static constraints = {
        name(unique: true)
        upType(nullable: true)
        relatedPersonTitle(nullable: true)
    }

    static mapping = {
        sort: 'id'
        subTypes sort: 'id'  //这是排序的标准做法
        things sort: 'id'
    }

    String toString() {
        return "${name}"
    }

    boolean bePartOf(ThingType athingType) {
        boolean isThis = athingType.equals(this)
        boolean isMember = subTypes.contains(athingType)
        return (isThis || isMember)
    }

}
