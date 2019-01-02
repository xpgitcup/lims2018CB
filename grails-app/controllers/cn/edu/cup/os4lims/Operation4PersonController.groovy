package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4PersonController {
    def personService

    def count() {
        def count = 0
        count = Person.count()
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

    def index() { }
}
