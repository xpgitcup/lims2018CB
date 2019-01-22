package cn.edu.cup.os4lims

import cn.edu.cup.lims.QueryStatement
import grails.converters.JSON

class Operation4QueryStatementController {

    def commonQueryService
    def commonService
    def queryStatementService

    def importFromJsonFile() {

        def fileName = commonService.queryStatementConfigFileName()
        def jsonFile = new File(fileName)
        if (jsonFile.exists()) {
            def json = jsonFile.text
            def queryList = com.alibaba.fastjson.JSON.parse(json)
            queryList.each { e ->
                println("导入${e}")
                def nq = QueryStatement.findByKeyString(e.keyString)
                if (!nq) {
                    nq = new QueryStatement()
                }
                e.each { item ->
                    nq.properties.put(item.key, item.value)
                }
                queryStatementService.save(nq)
            }
        }
        flash.message = "导入成功!"
        redirect(action: 'index')
    }

    def exportToJsonFile() {

        def fileName = commonService.queryStatementConfigFileName()
        println("${fileName}")

        def queryStatementList = []
        QueryStatement.list().each { e ->
            def q = [:]
            e.properties.each { ee ->
                q.put(ee.key, ee.value)
            }
            queryStatementList.add(q)
        }

        def fjson = com.alibaba.fastjson.JSON.toJSONString(queryStatementList)
        println("FastJson:")
        println(fjson)

        def printer = new File(fileName).newPrintWriter('utf-8')    //写入文件
        printer.println(fjson)
        printer.close()

        flash.message = "导出json文件成功！"

        redirect(action: 'index')
    }

    def list() {
        println("${params}")
        def (String view, List objectList, String message) = commonQueryService.listFunction(params)
        flash.message = message
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        def (count, message) = commonQueryService.countFunction(params)
        println("统计结果：${count}")
        flash.message = message
        if (count) {
            if (count[0] < 0) {
                flash.message = "功能尚未实现....."
                count = 0
            }
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
