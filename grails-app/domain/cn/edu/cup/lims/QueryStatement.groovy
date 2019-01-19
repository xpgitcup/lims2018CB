package cn.edu.cup.lims

class QueryStatement {

    String keyString
    String hql
    String viewName
    String paramsList

    static constraints = {
        keyString(unique: true)
        hql(nullable: true)
        viewName(nullable: true)
        paramsList(nullable: true)
    }

    String toString() {
        return "${keyString}"
    }
}
