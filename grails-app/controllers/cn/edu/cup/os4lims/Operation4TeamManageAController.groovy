package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.QueryStatement
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingTypeCircle
import grails.converters.JSON

class Operation4TeamManageAController {

    def commonQueryService
    def teamService

    def disband(Team team) {
        if (team) {
            teamService.delete(team.id)
        }
        redirect(action: "index")
    }

    def dismiss() {
        println("${params}")
        def person = Person.get(params.person)
        def team = Team.get(params.currentTeam)
        if (team) {
            if (team.members.contains(person)) {
                team.members.remove(person)
                teamService.save(team)
            }
        }
        chain(action: "index")
    }

    def quitTeam(Team team) {
        def myself = Person.get(session.realId)
        if (team.members.contains(myself)) {
            team.members.remove(myself)
            teamService.save(team)
        } else {
            flash.message = "不属于该团队!"
        }
        chain(action: "index")
    }

    def joinTeam(Team team) {
        def myself = Person.get(session.realId)
        if (!team.members.contains(myself)) {
            team.members.add(myself)
            teamService.save(team)
        } else {
            flash.message = "已经加入了!"
        }
        chain(action: "index")
    }

    def createTeam(Thing thing) {
        println("${params}")
        def leader = Person.get(session.realId)
        if (leader) {
            if (!Team.findAllByThingAndLeader(thing, leader)) {
                def team = new Team(leader: leader, thing: thing)
                teamService.save(team)
            } else {
                flash.message = "不能重复！"
            }
        } else {
            flash.message = "找不到这个成员！"
        }
        chain(action: "index")
    }

    def list() {
        prepareParams()
        def (String view, List objectList, String message) = commonQueryService.listFunction(params)
        flash.message = message
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    private void prepareParams() {
        // 任务
        def currentTitle = PersonTitle.get(session.realTitle)
        def list = ThingTypeCircle.allRelatedThingTypes(currentTitle)
        params.list = list
        // 当前任务
        if (params.currentThing) {
            def ct = Thing.get(params.currentThing)
            params.currentThing = ct
        }
        // 当前团队
        if (params.currentTeam) {
            def ct = Team.get(params.currentTeam)
            params.currentTeam = ct
        }
    }

    /*
    * 根据身份确定事情
    * 相关任务类型，如果任务类型不是叶子，继续向下搜索到叶子
    * */

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

    def index() {}
}
