package cn.edu.cup.common

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Thing
import grails.gorm.transactions.Transactional

@Transactional
class CommonQueryService {

    def queryStatementService

    List listFunction(params) {
        def keyString = generateKeyString(params)
        def view = "list"
        def message = ""
        def objectList
        def queryStatement = QueryStatement.findByKeyString(keyString)
        def pl = []
        if (queryStatement) {
            if (queryStatement.hql || queryStatement.viewName) {
                if (queryStatement.paramsList) {
                    pl.addAll(queryStatement.paramsList.split(","))
                }
                view = queryStatement.viewName
                def ps = [:]
                ps.offset = params.offset
                ps.max = params.max
                pl.each { e ->
                    ps.put(e, params.get(e))
                }
                println("list 参数：${ps}")
                objectList = QueryStatement.executeQuery(queryStatement.hql, ps)
            } else {
                message = "请完善list查询."
            }
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
        }
        return [view, objectList, message]
    }

    Object countFunction(params) {
        def keyString = generateKeyString(params)
        def count = 0
        def message = ""
        def queryStatement = QueryStatement.findByKeyString(keyString)
        def pl = []
        if (queryStatement) {
            if (!queryStatement.hql.isEmpty()) {
                if (queryStatement.paramsList) {
                    pl.addAll(queryStatement.paramsList.split(","))
                }
                def ps = [:]
                pl.each { e ->
                    ps.put(e, params.get(e))
                }
                println("count 参数：${ps}")
                count = QueryStatement.executeQuery(queryStatement.hql, ps)
            } else {
                message = "请完善count查询."
            }
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            count = -1
        }
        return [count, message]
    }

    private def generateKeyString(params) {
        println("内部：${params}")
        def keyString = ""
        def exclude = ["offset", "max", "id", "format"]
        def include = ["controller", "action", "key"]
        params.keySet().sort().each { e ->
            if (!exclude.contains(e)) {
                if (include.contains(e)) {
                    if (keyString.isEmpty()) {
                        keyString += "${params.get(e)}"
                    } else {
                        keyString += ".${params.get(e)}"
                    }
                } else {
                    if (keyString.isEmpty()) {
                        keyString += "${e}"
                    } else {
                        keyString += ".${e}"
                    }
                }
            }
        }
        println("Query ${keyString}")
        keyString
    }


}
