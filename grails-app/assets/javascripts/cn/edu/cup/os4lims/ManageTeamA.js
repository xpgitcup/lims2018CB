var operation4ManageTeamADiv;
var tabList4ManageTeamA = ["可选课题", "相关课题", "我的团队", "参与团队", "教师列表", "研究生", "本科生"];
var idList4ManageTeamA = ["currentThing", "currentRelatedThing", "currentTeamLeader", "currentTeamJoin"];

$(function () {
    console.info("课题选择...");

    operation4ManageTeamADiv = $("#operation4ManageTeamADiv");
    setupTabsWithDivAndPagination(operation4ManageTeamADiv, tabList4ManageTeamA);
    setupTabPageParams("operation4ManageTeamADiv", countManageTeamA, loadManageTeamA);

});

function call4Student(id) {
    var title = getCurrentTabTitle(operation4ManageTeamADiv);
    $.cookie("currentTeamLeader", id);
    $("#currentTeamLeader").html(id);
    operation4ManageTeamADiv.tabs("select", "本科生");
}

function call4Teacher(id) {
    var title = getCurrentTabTitle(operation4ManageTeamADiv);
    $.cookie("currentTeamLeader", id);
    $("#currentTeamLeader").html(id);
    operation4ManageTeamADiv.tabs("select", "教师列表");
}

function countManageTeamA(title) {
    console.info("统计基础数据..." + title);
    var ids = reflashDisplayTitle(idList4ManageTeamA)

    switch (title) {
        case "可选课题":
            total = ajaxCalculate("operation4ManageTeamA/count?key=thing4Choice");
            break
        case "相关课题":
            total = ajaxCalculate("operation4ManageTeamA/count?key=thingRelated");
            break
        case "我的团队":
            total = ajaxCalculate("operation4ManageTeamA/count?key=myTeam");
            break
        case "参与团队":
            total = ajaxCalculate("operation4ManageTeamA/count?key=teamJoin");
            break
        case "本科生":
            total = ajaxCalculate("operation4ManageTeamA/count?key=call4Student&teamLeader=" + ids[2]);
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
            ajaxRun("operation4ManageTeamA/list" + params + "&key=thing4Choice", 0, "list" + title + "Div");
            break
        case "相关课题":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=thingRelated", 0, "list" + title + "Div");
            break
        case "我的团队":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=myTeam" + currentThingTypeClassify, 0, "list" + title + "Div");
            break
        case "参与团队":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=teamJoin&thingType=" + currentThingType, 0, "list" + title + "Div");
            break
        case "教师列表":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=call4Teacher&teamLeader=" + ids[2], 0, "list" + title + "Div");
            break
        case "研究生":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=call4Master&teamLeader=" + ids[2], 0, "list" + title + "Div");
            break
        case "本科生":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=call4Student&teamLeader=" + ids[2], 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}