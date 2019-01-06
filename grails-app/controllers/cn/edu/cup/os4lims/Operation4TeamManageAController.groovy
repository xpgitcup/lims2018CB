package cn.edu.cup.os4lims

import cn.edu.cup.lims.PersonTitle
import grails.converters.JSON

class Operation4TeamManageAController {


    /*
    * 根据身份确定事情
    * 相关任务类型，如果任务类型不是叶子，继续向下搜索到叶子
    * */
    def count() {
        def currentTitle = PersonTitle.get(session.realTitle)
        println("当前身份：${currentTitle} ${currentTitle.relatedThingType.things}")
        def count = 0
        while (currentTitle.subTitles) {

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
