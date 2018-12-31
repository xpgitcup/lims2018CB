var operation4StudentTeamBDiv;
var tabList4ManageTeamB = ["可选题目", "相关团队", "相关队员"];
var operation4StudentTeamUl

$(function () {
    console.info("学生团队管理...");

    operation4StudentTeamUl = $("#operation4StudentTeamUl");
    operation4StudentTeamBDiv = $("#operation4StudentTeamBDiv");
    setupDisplayUl(operation4StudentTeamUl, tabList4ManageTeamB)
    setupTabsWithDivAndPagination(operation4StudentTeamBDiv, tabList4ManageTeamB);
    setupTabPageParams("operation4StudentTeamBDiv", countManageTeamB, loadManageTeamB);
    //var ids = loadAllDisplayTitleIdA(tabList4ManageTeamB);
});

function countManageTeamB(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4ManageTeamB);

    switch (title) {
        case "可选题目":
            total = ajaxCalculate("operation4StudentTeamB/count?key=things4StudentToSelect");
            break;
        case "相关团队":
            break;
        case "相关队员":
            break;
    }
}

function loadManageTeamB(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4StudentTeamUl, tabList4ManageTeamB);

    switch (title) {
        case "可选题目":
            ajaxRun("operation4StudentTeamB/list" + params + "&key=things4StudentToSelect", 0, "list" + title + "Div");
            break;
        case "相关团队":
            ajaxRun("operation4StudentTeamB/list" + params + "&key=relatedTeams&thing=" + ids[0], 0, "list" + title + "Div");
            break;
        case "相关队员":
            ajaxRun("operation4StudentTeamB/list" + params + "&key=teamMembersStudent&team=" + ids[1], 0, "list" + title + "Div");
            break;
    }
}

function checkMembers(id) {
    $.cookie("currentKey" + "相关团队", id);
    $("#churrentKey" + "相关团队").html(id);
    operation4StudentTeamBDiv.tabs("select", "相关队员");
}

function selectAndJoinTeam(id) {
    $.cookie("currentKey" + "可选题目", id);
    $("#churrentKey" + "可选题目").html(id);
    console.info("查看：" + id + "团队。")
    operation4StudentTeamBDiv.tabs("select", "相关团队");
}

function selectAndCreateTeam(id) {
    $.cookie("currentKey" + "可选题目", id);
    $("#churrentKey" + "可选题目").html(id);
    console.info("创建：" + id + "团队。")
    operation4StudentTeamBDiv.tabs("select", "相关团队");
    ajaxExecute("operation4StudentTeamB/selectAndCreateTeam/" + id);
    location.reload();
}