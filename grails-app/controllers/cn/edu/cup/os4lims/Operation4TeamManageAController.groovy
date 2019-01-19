package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingTypeCircle
import grails.converters.JSON

class Operation4TeamManageAController {

    def queryStatementService

    /*
    * 根据身份确定事情
    * 相关任务类型，如果任务类型不是叶子，继续向下搜索到叶子
    * */
    def count() {
        def currentTitle = PersonTitle.get(session.realTitle)
        def list = ThingTypeCircle.allRelatedThingTypes(currentTitle)
        println("当前身份：${currentTitle}， 任务类型： ${list}")
        params.list = list
        def count = countFunction(params)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    private Object countFunction(params) {
        def keyString = "${params.controller}.${params.action}.${params.key}"
        def count = 0
        def hql = QueryStatement.findByKeyString(keyString)
        if (hql) {
            count = Thing.executeQuery(hql.hql, params)
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            flash.message = "功能尚未实现!"
        }
        count
    }

    def index() { }
}
