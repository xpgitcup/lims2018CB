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
        def hql = QueryStatement.findByKeyString(keyString)
        def pl = hql.paramsList.split(",")
        if (hql) {
            view = hql.viewName
            def ps = [:]
            ps.offset = params.offset
            ps.max = params.max
            pl.each { e->
                ps.put(e, params.get(e))
            }
            println("hql 参数：${ps}")
            objectList = Person.executeQuery(hql.hql, ps)
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
        }
        return [view, objectList]
    }

    Object countFunction(params) {
        def keyString = "${params.controller}.${params.action}.${params.key}"
        def count = 0
        def hql = QueryStatement.findByKeyString(keyString)
        def pl = hql.paramsList.split(",")
        if (hql) {
            def ps = [:]
            pl.each { e->
                ps.put(e, params.get(e))
            }
            println("hql 参数：${ps}")
            count = Thing.executeQuery(hql.hql, ps)
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            count = -1
        }
        return count
    }

}
