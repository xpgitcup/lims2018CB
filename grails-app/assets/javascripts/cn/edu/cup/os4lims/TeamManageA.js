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
    switch (title) {
        case "相关团队":
            total = ajaxCalculate("operation4TeamManageA/count?key=" + title + "&currentThing=" + ids[0]);
            break
        case "相关队员":
            total = ajaxCalculate("operation4TeamManageA/count?key=" + title + "&currentTeam=" + ids[1]);
            break
        default:
            total = ajaxCalculate("operation4TeamManageA/count?key=" + title);
    }
    return total
}

function loadTeamManageA(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4TeamManageAUl, tabList4TeamManageA);
    switch (title) {
        case "相关团队":
            ajaxRun("operation4TeamManageA/list" + params + "&key=" + title + "&currentThing=" + ids[0], 0, "list" + title + "Div");
            break
        case "相关队员":
            ajaxRun("operation4TeamManageA/list" + params + "&key=" + title + "&currentTeam=" + ids[1], 0, "list" + title + "Div");
            break
        default:
            ajaxRun("operation4TeamManageA/list" + params + "&key=" + title, 0, "list" + title + "Div");
    }
}

function disband(id) {
    ajaxExecute("operation4TeamManageA/disband/" + id)
    location.reload();
}

function dismiss(id) {
    var ids = reflashDisplayTitleA(operation4TeamManageAUl, tabList4TeamManageA);
    ajaxExecute("operation4TeamManageA/dismiss/?person=" + id + "&currentTeam=" + ids[1])
    location.reload();
}

function quitTeam(id) {
    ajaxExecute("operation4TeamManageA/quitTeam/" + id);
    operation4TeamManageADiv.tabs("select", "相关队员");
    location.reload();
}

function joinTeam(id) {
    ajaxExecute("operation4TeamManageA/joinTeam/" + id)
    selectCurrentItem(id)
    operation4TeamManageADiv.tabs("select", "相关队员");
}

function createTeam(id) {
    console.info("创建团队...");
    selectCurrentItem(id)
    ajaxExecute("operation4TeamManageA/createTeam/" + id)
    operation4TeamManageADiv.tabs("select", "相关团队");
}

function listTeam(id) {
    selectCurrentItem(id)
    operation4TeamManageADiv.tabs("select", "相关团队");
}

function selectCurrentItem(id) {
    var title = getCurrentTabTitle(operation4TeamManageADiv)
    $.cookie("currentKey" + title, id);
}

function listMembers(id) {
    selectCurrentItem(id)
    operation4TeamManageADiv.tabs("select", "相关队员");
}
