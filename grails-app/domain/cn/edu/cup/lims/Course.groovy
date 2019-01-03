package cn.edu.cup.lims

class Course extends Thing {

    Teacher teacher
    String schoolYear

    static constraints = {
        name()
        teacher()
        schoolYear()
    }

}
