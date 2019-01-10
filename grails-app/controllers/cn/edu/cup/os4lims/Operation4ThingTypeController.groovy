package cn.edu.cup.os4lims

import cn.edu.cup.lims.ThingType
import cn.edu.cup.system.JsFrame
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4ThingTypeController {

    def treeViewService
    def thingTypeService

    def show(Long id) {
        def thingType = thingTypeService.get(id)
        println("show ${thingType}")
        def view = "show"
        if (request.xhr) {
            render(template: view, model: [thingType: thingType])
        } else {
            respond thingType
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        thingTypeService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'thingType.label', default: 'PersonTitle'), id])

        redirect(action: "index")
    }

    def update(ThingType thingType) {
        if (thingType == null) {
            notFound()
            return
        }

        try {
            thingTypeService.save(thingType)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'thingType.label', default: 'ThingType'), thingType.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def edit(Long id) {
        def thingType = thingTypeService.get(id)
        def view = "edit"
        if (request.xhr) {
            render(template: view, model: [thingType: thingType])
        } else {
            respond thingType
        }
    }

    def save(ThingType thingType) {
        if (thingType == null) {
            notFound()
            return
        }

        try {
            thingTypeService.save(thingType)
            flash.message = message(code: 'default.created.message', args: [message(code: 'thingType.label', default: 'ThingType'), thingType.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def create(ThingType aThingType) {
        println("${params}")
        def thingType = new ThingType(upType: aThingType)
        def view = "create"
        if (request.xhr) {
            render(template: view, model: [thingType: thingType])
        } else {
            respond thingType
        }
    }

    def getTreeViewData() {
        def data = ThingType.findAllByUpTypeIsNull()
        params.context = "name"
        params.subItems = "subTypes"
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

    def count() {
        def count = 0
        count = ThingType.countByUpTypeIsNull()
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
