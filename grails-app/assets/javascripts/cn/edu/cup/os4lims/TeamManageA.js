var operation4TeamManageADiv;
var tabList4TeamManageA = ["可选题目", "相关团队", "相关队员"];
var operation4TeamManageAUl

$(function () {
    console.info("学生团队管理...");

    operation4TeamManageAUl = $("#operation4TeamManageAUl");
    operation4TeamManageADiv = $("#operation4TeamManageADiv");
    setupDisplayUl(operation4TeamManageAUl, tabList4TeamManageA)
    setupTabsWithDivAndPagination(operation4TeamManageADiv, tabList4TeamManageA);
    setupTabPageParams("operation4TeamManageADiv", countTeamManageA, loadTeamManageA);
    //var ids = loadAllDisplayTitleIdA(tabList4TeamManageA);
});

function countTeamManageA(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4TeamManageA);
    total = ajaxCalculate("operation4TeamManageA/count?key=" + title);
    return total
}

function loadTeamManageA(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4TeamManageAUl, tabList4TeamManageA);
    ajaxRun("operation4TeamManageA/list" + params + "&key=" + title, 0, "list" + title + "Div");
}

function checkMembers(id) {
    $.cookie("currentKey" + "相关团队", id);
    $("#churrentKey" + "相关团队").html(id);
    operation4TeamManageADiv.tabs("select", "相关队员");
}

function selectAndJoinTeam(id) {
    $.cookie("currentKey" + "可选题目", id);
    $("#churrentKey" + "可选题目").html(id);
    console.info("查看：" + id + "团队。")
    operation4TeamManageADiv.tabs("select", "相关团队");
}

function selectAndCreateTeam(id) {
    $.cookie("currentKey" + "可选题目", id);
    $("#churrentKey" + "可选题目").html(id);
    console.info("创建：" + id + "团队。")
    operation4TeamManageADiv.tabs("select", "相关团队");
    ajaxExecute("operation4TeamManageA/selectAndCreateTeam/" + id);
    location.reload();
}