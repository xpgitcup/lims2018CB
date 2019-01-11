package cn.edu.cup.os4lims

import cn.edu.cup.lims.ThingTypeCircle
import cn.edu.cup.lims.ThingTypeCircleService
import grails.validation.ValidationException

class Operation4ThingTypeAndPersonTitleController {

    ThingTypeCircleService thingTypeCircleService

    def save(ThingTypeCircle thingTypeCircle) {
        if (thingTypeCircle == null) {
            notFound()
            return
        }

        try {
            thingTypeCircleService.save(thingTypeCircle)
            flash.message = message(code: 'default.created.message', args: [message(code: 'thingTypeCircle.label', default: 'ThingTypeCircle'), thingTypeCircle.id])
        } catch (ValidationException e) {
            flash.message = e.message
        }

        redirect(action: "index")
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond thingTypeCircleService.list(params), model:[thingTypeCircleCount: thingTypeCircleService.count()]
    }
}
