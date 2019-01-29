package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import grails.converters.JSON

class Operation4ProgressController {

    def commonQueryService

    def list() {
        prepareParams()
        def (String view, List objectList, String message) = commonQueryService.listFunction(params)
        flash.message = message
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        prepareParams()
        def (count, message) = commonQueryService.countFunction(params)
        flash.message = message
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

    private void prepareParams() {
        def myself = Person.get(session.realId)
        switch (params.key) {
            case "":
                break
                params.myself = myself.id
            default:
                params.myself = myself
        }
    }

    def index() { }
}
