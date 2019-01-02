package cn.edu.cup.lims

class PersonTitle {

    String name
    PersonTitle upTitle

    static hasMany = [subTitles: PersonTitle, persons: Person]

    static constraints = {
        name(unique: true)
        upTitle(nullable: true)
    }

    static mapping = {
        sort: 'id'
        subTitles sort: 'id'  //这是排序的标准做法
        persons sort: 'id'
    }

    String toString() {
        return name
    }

    boolean bePartOf(PersonTitle aTitle) {
        boolean isThis = aTitle.equals(this)
        boolean isMember = subTitles.contains(aTitle)
        return (isThis || isMember)
    }

}
