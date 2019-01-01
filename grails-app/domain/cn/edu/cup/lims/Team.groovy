package cn.edu.cup.lims

class Team {

    Person leader
    Thing thing

    static hasMany = [members: Person]

    static constraints = {
        leader()
        thing()
    }

    String toString() {
        return "${thing}.${leader}"
    }
}
