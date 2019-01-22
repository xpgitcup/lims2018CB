package cn.edu.cup.os4lims

import grails.converters.JSON

class Operation4ProgressController {

    def commonQueryService

    def count() {
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

    def index() { }
}
