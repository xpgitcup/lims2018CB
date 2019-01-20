package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingTypeCircle
import grails.converters.JSON

class Operation4TeamManageAController {

    def commonQueryService

    def list() {
        println("${params}")
        def currentTitle = PersonTitle.get(session.realTitle)
        def list = ThingTypeCircle.allRelatedThingTypes(currentTitle)
        println("当前身份：${currentTitle}， 任务类型： ${list}")
        params.list = list
        def (String view, List objectList) = commonQueryService.listFunction(params)
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    /*
    * 根据身份确定事情
    * 相关任务类型，如果任务类型不是叶子，继续向下搜索到叶子
    * */

    def count() {
        def currentTitle = PersonTitle.get(session.realTitle)
        def list = ThingTypeCircle.allRelatedThingTypes(currentTitle)
        println("当前身份：${currentTitle}， 任务类型： ${list}")
        params.list = list
        def count = commonQueryService.countFunction(params)
        println("统计结果：${count}")
        if (count[0] < 0) {
            flash.message = "功能尚未实现....."
            count = 0
        }
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
