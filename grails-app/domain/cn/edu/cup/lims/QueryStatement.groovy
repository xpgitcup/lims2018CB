package cn.edu.cup.lims

class QueryStatement {

    String keyString
    String hql
    String viewName
    String keys

    static constraints = {
        keyString(unique: true)
        hql(nullable: true)
        viewName(nullable: true)
        keys(nullable: true)
    }

    String toString() {
        return "${keyString}"
    }
}
