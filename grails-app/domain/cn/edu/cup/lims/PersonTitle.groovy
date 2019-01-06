package cn.edu.cup.lims

class PersonTitle {

    String name
    PersonTitle upTitle
    ThingType relatedThingType

    static hasMany = [subTitles: PersonTitle, persons: Person]

    static constraints = {
        name(unique: true)
        upTitle(nullable: true)
        relatedThingType(nullable: true)
    }

    static mapping = {
        sort: 'id'
        subTitles sort: 'id'  //这是排序的标准做法
        persons sort: 'id'
    }

    String toString() {
        return name
    }

    def beforeInsert() {
        if (relatedThingType == null) {
            if (upTitle) {
                relatedThingType = upTitle.relatedThingType
            }
        }
    }

    boolean bePartOf(PersonTitle aTitle) {
        boolean isThis = aTitle.equals(this)
        boolean isMember = subTitles.contains(aTitle)
        return (isThis || isMember)
    }

    static def checkThingType() {
        def tlist = PersonTitle.findAllByRelatedThingTypeIsNull()
        tlist.each { e->
            if (e.upTitle) {
                e.relatedThingType = e.upTitle.relatedThingType
            } else {
                e.relatedThingType = ThingType.findByName("全部任务")
            }
        }
    }
}
