package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.Team
import grails.converters.JSON

class Operation4ProgressController {

    def commonQueryService

    def list() {
        def objectList = []
        prepareParams()
        def (String view, List tempList, String message) = commonQueryService.listFunction(params)
        switch (params.key) {
            case "我参与的":
                tempList.each { e ->
                    objectList.add(Team.get(e.team_members_id))
                }
                break
            default:
                objectList.addAll(tempList)
        }
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
            case "我参与的":
                params.myself = myself.id
                break
            default:
                params.myself = myself
        }
    }

    def index() {}
}
