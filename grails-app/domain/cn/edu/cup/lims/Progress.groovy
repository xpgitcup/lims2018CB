package cn.edu.cup.lims

class Progress {

    Progress prevProgress
    String currentStatus
    String problemEncounter
    String supportFileName
    Person contributor
    Date regDate = new Date()

    static belongsTo = [thing: Thing]

    static constraints = {
        prevProgress(nullable: true)
        currentStatus(nullable: false)
        problemEncounter(nullable: true)
        supportFileName(nullable: true)
        contributor(nullable: false)
        regDate()
    }

    String toString() {
        return "${thing}.${contributor}.${regDate}.progress"
    }

}
