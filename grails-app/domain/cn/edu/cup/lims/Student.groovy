package cn.edu.cup.lims

class Student {

    String gradeName            //年级
    Teacher supervisor          //导师
    Major major                //专业

    static constraints = {
        code()
        name()
        gradeName()
        supervisor(nullable: true)
        major()
    }

}
