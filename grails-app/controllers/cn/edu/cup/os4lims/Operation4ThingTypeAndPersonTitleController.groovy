package cn.edu.cup.os4lims

import cn.edu.cup.lims.ThingTypeCircle
import cn.edu.cup.lims.ThingTypeCircleService
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4ThingTypeAndPersonTitleController {

    ThingTypeCircleService thingTypeCircleService

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        thingTypeCircleService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'thingTypeCircle.label', default: 'ThingTypeCircle'), id])

        redirect(action: "index")
    }

    def list() {
        def objectList = ThingTypeCircle.list(params)
        def view = "listThingTypeCircle"
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        def count = 0
        count = ThingTypeCircle.count()
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def save(ThingTypeCircle thingTypeCircle) {
        if (thingTypeCircle == null) {
            notFound()
            return
        }

        if (ThingTypeCircle.countByThingTypeAndPersonTitle(thingTypeCircle.thingType, thingTypeCircle.personTitle) > 0) {
            flash.message = "重复了！"
        } else {
            try {
                thingTypeCircleService.save(thingTypeCircle)
                flash.message = message(code: 'default.created.message', args: [message(code: 'thingTypeCircle.label', default: 'ThingTypeCircle'), thingTypeCircle.id])
            } catch (ValidationException e) {
                flash.message = e.message
            }
        }

        redirect(action: "index")
    }

    def index() {}
}
