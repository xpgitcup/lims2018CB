package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4PersonController {

    def personService
    def excelByJxlService
    def commonService
    def studentService
    def teacherService
    def queryStatementService
    def systemCommonService

    def removeFromSystemUserGrade() {
        def k = 0
        def grade = params.grade
        def students = Student.findAllByGradeName(grade)
        students.each { e ->
            if (systemCommonService.removePersonFromUser(e)) {
                k++
            }
        }
        flash.message = "毕业${k}名学生。"
        redirect(action: "index")
    }

    def removeFromSystemUser() {
        switch (params.key) {
            case "student":
                def student = studentService.get(params.id)
                if (!student) {
                    flash.message = "${params.id} -- 找不到学生。"
                } else {
                    systemCommonService.removePersonFromUser(student)
                }
                break
            case "teacher":
                def teacher = teacherService.get(params.id)
                if (!teacher) {
                    flash.message = "${params.id} -- 找不到。"
                } else {
                    systemCommonService.removePersonFromUser(teacher)
                }
                break
        }
        redirect(action: "index")
    }

    def addToSystemUserGrade() {
        def k = 0
        def grade = params.grade
        def students = Student.findAllByGradeName(grade)
        students.each { e ->
            if (systemCommonService.addPersonToUser(e)) {
                k++
            }
        }
        flash.message = "新入学${k}名学生。"
        redirect(action: "index")
    }

    def addToSystemUser() {
        switch (params.key) {
            case "student":
                def student = studentService.get(params.id)
                if (!student) {
                    flash.message = "${params.id} -- 找不到学生。"
                }
                systemCommonService.addPersonToUser(student)
                break
            case "teacher":
                def teacher = teacherService.get(params.id)
                if (!teacher) {
                    flash.message = "${params.id} -- 找不到。"
                }
                systemCommonService.addPersonToUser(teacher)
                break;
        }
        redirect(action: "index")
    }

    def importFromFile() {
        println("导入...${params}")
        if (!params.uploadedFile.empty) {
            //处理文件上传
            def destDir = commonService.webRootPath + "file4import"
            params.destDir = destDir
            println(destDir)
            def sf = commonService.upload(params)
            println("上传${sf}成功...")
            def data = excelByJxlService.importExcelFileToDataTable(sf)
            println("${data}")
            if (data.size() > 0) {
                def resultstr = ""
                def r
                data.eachWithIndex { e, i ->
                    if (i > 0) {
                        println("当前 ${e}")
                        switch (params.key) {
                            case "教师":
                                def t = new Teacher()
                                r = t.importFromDataSheet(e)
                                if (r.result.empty) {
                                    teacherService.save(r.teacher)
                                }
                                break
                            case "学生":
                                def s = new Student()
                                r = s.importFromDataSheet(e)
                                if (r.result.empty) {
                                    studentService.save(s)
                                }
                                break
                        }
                        if (resultstr.empty) {
                            resultstr += r.result
                        } else {
                            resultstr += ","
                            resultstr += r.result
                        }
                    }
                }
                if (resultstr.empty) {
                    flash.message = "导入${data.size()}个记录."
                } else {
                    flash.message += resultstr
                }
            }
        } else {
            flash.message = "空文件！"
        }
        redirect(action: "index")
    }

    def downloadTemplate() {
        def key = params.key
        def head = []
        def fileName
        switch (key) {
            case "教师":
                head.add(Teacher.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/teacher.xls"
                break
            case "学生":
                head.add(Student.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/student.xls"
                break
        }
        excelByJxlService.exportDataTable2ExcelFile(head, fileName)
        params.downLoadFileName = fileName
        commonService.downLoadFile(params)
    }

    def list() {
        println("${params}")
        def (String view, List objectList) = listFunction(params)
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    private List listFunction(params) {
        def keyString = "${params.controller}.${params.action}.${params.key}"
        def view = "list"
        def objectList
        def hql = QueryStatement.findByKeyString(keyString)
        if (hql) {
            view = hql.viewName
            def ps = [:]
            ps.offset = params.offset
            ps.max = params.max
            objectList = Person.executeQuery(hql.hql, ps)
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            flash.message = "功能尚未实现!"
        }
        [view, objectList]
    }

    def count() {
        Object count = countFunction(params)
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
            count = Person.executeQuery(hql.hql)
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            flash.message = "功能尚未实现!"
        }
        count
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        personService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])

        redirect(action: "index")
    }

    def save(Person person) {
        if (person == null) {
            notFound()
            return
        }

        try {
            personService.save(person)
            flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), person.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def update(Person person) {
        if (person == null) {
            notFound()
            return
        }

        try {
            personService.save(person)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), person.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def edit(Long id) {
        def person = personService.get(id)
        def view = "edit"
        if (request.xhr) {
            render(template: view, model: [person: person])
        } else {
            respond person
        }
    }

    def create() {
        println("${params}")
        def person = new Person()
        def view = "create"
        if (request.xhr) {
            render(template: view, model: [person: person])
        } else {
            respond person
        }
    }

    def index() {}
}
