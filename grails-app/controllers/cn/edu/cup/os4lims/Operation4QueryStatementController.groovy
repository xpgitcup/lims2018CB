package cn.edu.cup.os4lims

import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.ThingTypeCircle
import grails.converters.JSON

class Operation4QueryStatementController {
    def commonQueryService

    def list() {
        println("${params}")
        def (String view, List objectList) = commonQueryService.listFunction(params)
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
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

    def index() { }
}
