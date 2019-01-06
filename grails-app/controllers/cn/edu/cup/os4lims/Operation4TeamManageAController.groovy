package cn.edu.cup.os4lims

import cn.edu.cup.lims.PersonTitle
import grails.converters.JSON

class Operation4TeamManageAController {

    def count() {
        def currentTitle = PersonTitle.get(session.realTitle)
        println("当前身份：${currentTitle} ${currentTitle.relatedThingType.things}")
        def count = currentTitle.relatedThingType.things.size()
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() { }
}
