var operation4ThingDiv;
var tabList4Thing = ["科研", "教学"];
var operation4ThingUl;

$(function () {
    console.info("项目管理...");

    //静态设置
    operation4ThingUl = $("#operation4ThingUl")
    operation4ThingDiv = $("#operation4ThingDiv");

    setupDisplayUl(operation4ThingUl, tabList4Thing)

    setupTabsWithDivAndPagination(operation4ThingDiv, tabList4Thing);
    setupTabPageParams("operation4ThingDiv", countThing, loadThing);

});

function shiftDisplay(title) {
    console.info("显示当前提示...")
    $("#currentTemplate").html("下载[" + title + "]模板");
    $("#currentTemplate").attr("href", "operation4Thing/downloadTemplate?key=" + title);
    $("#currentImport").html("导入[" + title + "]数据");
    $("#importKey").attr("value", title);
}

function countThing(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4Thing);
    shiftDisplay(title);
    total = ajaxCalculate("operation4Thing/count?key=" + title);
    return total;
}

function loadThing(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4ThingUl, tabList4Thing);
    ajaxRun("operation4Thing/list" + params + "&key=" + title, 0, "list" + title + "Div");
}
