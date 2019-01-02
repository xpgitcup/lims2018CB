package cn.edu.cup.os4lims

import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.system.JsFrame
import grails.converters.JSON
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

class Operation4PersonTitleController {

    def treeViewService
    def personTitleService

    def count() {
        def count = 0
        count = PersonTitle.countByUpTitleIsNull()
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

        personTitleService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), id])

        redirect(action: "index")
    }

    def save(PersonTitle personTitle) {
        if (personTitle == null) {
            notFound()
            return
        }

        try {
            personTitleService.save(personTitle)
            flash.message = message(code: 'default.created.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), personTitle.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def update(PersonTitle personTitle) {
        if (personTitle == null) {
            notFound()
            return
        }

        try {
            personTitleService.save(personTitle)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), personTitle.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def edit(Long id) {
        def personTitle = personTitleService.get(id)
        def view = "edit"
        if (request.xhr) {
            render(template: view, model: [personTitle: personTitle])
        } else {
            respond personTitle
        }
    }

    def create(PersonTitle apersonTitle) {
        println("${params}")
        def personTitle = new PersonTitle(upTitle: apersonTitle)
        def view = "create"
        if (request.xhr) {
            render(template: view, model: [personTitle: personTitle])
        } else {
            respond personTitle
        }
    }

    def getTreeViewData() {
        def data = PersonTitle.findAllByUpTitleIsNull()
        params.context = "name"
        params.subItems = "subTitles"
        params.attributes = "id"    //
        params.useMethod = false
        def treeviewData = treeViewService.generateNodesString(data, params, JsFrame.EasyUI)
        println("树形数据：${treeviewData}")
        if (request.xhr) {
            render treeviewData as JSON
        } else {
            respond treeviewData
        }
    }

    def index() {}
}
