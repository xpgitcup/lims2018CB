var operation4ProgressDiv;
var operation4ProgressUl;
var tabList4Progress = ["相关任务","查看进度"];


$(function () {
    console.info("任务管理...");

    operation4ProgressUl = $("#operation4ProgressUl");
    operation4ProgressDiv = $("#operation4ProgressDiv");
    setupDisplayUl(operation4ProgressUl, tabList4Progress)
    setupTabsWithDivAndPagination(operation4ProgressDiv, tabList4Progress);
    setupTabPageParams("operation4ProgressDiv", countProgress, loadProgress);

});

function countProgress(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4Progress);
    switch (title) {
        case "相关团队":
            total = ajaxCalculate("operation4Progress/count?key=" + title + "&currentThing=" + ids[0]);
            break
        case "相关队员":
            total = ajaxCalculate("operation4Progress/count?key=" + title + "&currentTeam=" + ids[1]);
            break
        default:
            total = ajaxCalculate("operation4Progress/count?key=" + title);
    }
    return total
}

function loadProgress(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4ProgressUl, tabList4Progress);
    switch (title) {
        case "相关团队":
            ajaxRun("operation4Progress/list" + params + "&key=" + title + "&currentThing=" + ids[0], 0, "list" + title + "Div");
            break
        case "相关队员":
            ajaxRun("operation4Progress/list" + params + "&key=" + title + "&currentTeam=" + ids[1], 0, "list" + title + "Div");
            break
        default:
            ajaxRun("operation4Progress/list" + params + "&key=" + title, 0, "list" + title + "Div");
    }
}
