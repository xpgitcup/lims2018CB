var operation4StudentTeamADiv;
var tabList4ManageTeamA = ["可选课题", "相关课题", "我的团队", "参与团队", "我的队员", "本科生"];
var idList4ManageTeamA = ["currentThing", "currentRelatedThing", "currentTeamLeader", "currentTeamJoin"];

$(function () {
    console.info("课题选择...");

    operation4StudentTeamADiv = $("#operation4StudentTeamADiv");
    setupTabsWithDivAndPagination(operation4StudentTeamADiv, tabList4ManageTeamA);
    setupTabPageParams("operation4StudentTeamADiv", countManageTeamA, loadManageTeamA);

});

function call4Student(id) {
    var title = getCurrentTabTitle(operation4StudentTeamADiv);
    $.cookie("currentTeamLeader", id);
    $("#currentTeamLeader").html(id);
    operation4StudentTeamADiv.tabs("select", "本科生");
}

function countManageTeamA(title) {
    console.info("统计基础数据..." + title);
    var ids = reflashDisplayTitle(idList4ManageTeamA)

    switch (title) {
        case "可选课题":
            total = ajaxCalculate("operation4StudentTeamA/count?key=thing4ChoiceStudent");
            break
        case "相关课题":
            total = ajaxCalculate("operation4StudentTeamA/count?key=thingRelated");
            break
        case "我的团队":
            total = ajaxCalculate("operation4StudentTeamA/count?key=myTeam");
            break
        case "参与团队":
            total = ajaxCalculate("operation4StudentTeamA/count?key=teamJoinStudent&thing=" + ids[0]);
            break
        case "本科生":
            total = ajaxCalculate("operation4StudentTeamA/count?key=call4Student&teamLeader=" + ids[2]);
            break
    }
    return total;
}

function loadManageTeamA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = loadAllDisplayTitleId(idList4ManageTeamA)

    switch (title) {
        case "可选课题":
            ajaxRun("operation4StudentTeamA/list" + params + "&key=thing4ChoiceStudent", 0, "list" + title + "Div");
            break
        case "相关课题":
            ajaxRun("operation4StudentTeamA/list" + params + "&key=thingRelated", 0, "list" + title + "Div");
            break
        case "我的团队":
            ajaxRun("operation4StudentTeamA/list" + params + "&key=myTeam", 0, "list" + title + "Div");
            break
        case "参与团队":
            ajaxRun("operation4StudentTeamA/list" + params + "&key=teamJoinStudent", 0, "list" + title + "Div");
            break
        case "本科生":
            ajaxRun("operation4StudentTeamA/list" + params + "&key=call4Student&teamLeader=" + ids[2], 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}