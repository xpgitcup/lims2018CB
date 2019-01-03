package cn.edu.cup.lims

class QueryStatement {

    String keyString
    String hql
    String viewName

    static constraints = {
        keyString(unique: true)
        hql(nullable: true)
        viewName(nullable: true)
    }

    String toString() {
        return "${keyString}"
    }
}
