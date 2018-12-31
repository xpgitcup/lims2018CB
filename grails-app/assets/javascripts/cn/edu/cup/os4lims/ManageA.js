var operation4ManageADiv;
var tabList4ManageA = ["任务分类", "具体任务", "任务安排"];
var idList4ManageA = ["currentThingTypeClassify", "currentThingType"];

$(function () {
    console.info("给事儿分配人...");
    operation4ManageADiv = $("#operation4ManageADiv");
    setupTabsWithDivAndPagination(operation4ManageADiv, tabList4ManageA);
    setupTabPageParams("operation4ManageADiv", countManageA, loadManageA);
});

function updateDisplayTitle() {
    var currentId
    for (index in idList4ManageA) {
        currentId = readCookie(idList4ManageA[index], 0)
        $("#" + idList4ManageA[index]).html(currentId)
    }
}

function clickListItem(id) {
    var x = getCurrentTabIndex(operation4ManageADiv)
    console.info("点击操作：" + x);
    $("#" + idList4ManageA[x]).html(id)
    $.cookie(idList4ManageA[x], id);
    var ix = (x + 1) % 3
    operation4ManageADiv.tabs("select", tabList4ManageA[ix]);
}

function arrangeIt(id) {
    $("#currentThingType").html(id);
    $.cookie("currentThingType", id);
    var title = getCurrentTabTitle(operation4ManageADiv)
    ajaxRun("operation4ManageA/createTaskAllocation/?thingType=" + id, 0, "list" + title + "Div");
}

function countManageA(title) {
    console.info("统计基础数据..." + title);
    var currentThingTypeClassify = readCookie("currentThingTypeClassify", 0);
    var currentThingType = readCookie("currentThingType", 0);
    switch (title) {
        case "任务分类":
            total = ajaxCalculate("operation4ManageA/count?key=thingTypeClassify");
            break
        case "具体任务":
            total = ajaxCalculate("operation4ManageA/count?key=thingType&upType=" + currentThingTypeClassify);
            break
        case "任务安排":
            total = ajaxCalculate("operation4ManageA/count?key=taskAllocation&thingType=" + currentThingType);
            break
    }
    return total;
}

function loadManageA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    updateDisplayTitle();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var currentThingTypeClassify = readCookie("currentThingTypeClassify", 0);
    var currentThingType = readCookie("currentThingType", 0);
    console.info("当前参数：" + currentThingTypeClassify + "," + currentThingType)
    switch (title) {
        case "任务分类":
            ajaxRun("operation4ManageA/list" + params + "&key=thingTypeClassify", 0, "list" + title + "Div");
            break
        case "具体任务":
            ajaxRun("operation4ManageA/list" + params + "&key=thingType&upType=" + currentThingTypeClassify, 0, "list" + title + "Div");
            break
        case "任务安排":
            ajaxRun("operation4ManageA/list" + params + "&key=taskAllocation&thingType=" + currentThingType, 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}

