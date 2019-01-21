package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.Project
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Course
import cn.edu.cup.lims.Thing
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4ThingController {

    def excelByJxlService
    def commonService
    def courseService
    def projectService
    def queryStatementService
    def commonQueryService

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
                            case "科研":
                                def t = new Project()
                                r = t.importFromDataSheet(e)
                                if (r.result.empty) {
                                    projectService.save(r.project)
                                }
                                break
                            case "教学":
                                def s = new Course()
                                r = s.importFromDataSheet(e)
                                if (r.result.empty) {
                                    courseService.save(s)
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
            case "科研":
                head.add(Project.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/project.xls"
                break
            case "教学":
                head.add(Course.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/course.xls"
                break
        }
        excelByJxlService.exportDataTable2ExcelFile(head, fileName)
        params.downLoadFileName = fileName
        commonService.downLoadFile(params)
    }

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
        Object count = commonQueryService.countFunction(params)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        projectService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Person'), id])

        redirect(action: "index")
    }

    def save(Person project) {
        if (project == null) {
            notFound()
            return
        }

        try {
            teacherService.save(teacher)
            flash.message = message(code: 'default.created.message', args: [message(code: 'teacher.label', default: 'Person'), teacher.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def update(Person teacher) {
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

    def index() { }
}
