package cn.edu.cup.lims

class PersonTitle {

    String name
    PersonTitle upTitle

    static hasMany = [subTitles: PersonTitle, persons: Person]

    static constraints = {
        name(unique: true)
        upTitle(nullable: true)
    }

    String toString() {
        return name
    }
}
