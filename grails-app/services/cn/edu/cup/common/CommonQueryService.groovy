package cn.edu.cup.common

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Thing
import grails.gorm.transactions.Transactional

@Transactional
class CommonQueryService {

    def queryStatementService

    List listFunction(params) {
        def keyString = "${params.controller}.${params.action}.${params.key}"
        def view = "list"
        def objectList
        def queryStatement = QueryStatement.findByKeyString(keyString)
        def pl = []
        if (queryStatement) {
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
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
        }
        return [view, objectList]
    }

    Object countFunction(params) {
        def keyString = "${params.controller}.${params.action}.${params.key}"
        def count = 0
        def queryStatement = QueryStatement.findByKeyString(keyString)
        def pl = []
        if (queryStatement.paramsList) {
            pl.addAll(queryStatement.paramsList.split(","))
        }
        if (queryStatement) {
            def ps = [:]
            pl.each { e ->
                ps.put(e, params.get(e))
            }
            println("count 参数：${ps}")
            count = QueryStatement.executeQuery(queryStatement.hql, ps)
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            count = -1
        }
        return count
    }

}
