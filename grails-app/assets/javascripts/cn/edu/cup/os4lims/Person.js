var operation4PersonDiv;
var tabList4Person = ["教师", "学生", "专业"];
var operation4PersonUl;

$(function () {
    console.info("人员管理...");

    //静态设置
    operation4PersonUl = $("#operation4PersonUl")
    operation4PersonDiv = $("#operation4PersonDiv");

    setupDisplayUl(operation4PersonUl, tabList4Person)

    setupTabsWithDivAndPagination(operation4PersonDiv, tabList4Person);
    setupTabPageParams("operation4PersonDiv", countPerson, loadPerson);

});

function shiftDisplay(title) {
    console.info("显示当前提示...")
    $("#currentTemplate").html("下载[" + title + "]模板");
    $("#currentTemplate").attr("href", "operation4Person/downloadTemplate?key=" + title);
    $("#currentImport").html("导入[" + title + "]数据");
    $("#importKey").attr("value", title);
}

function countPerson(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4Person);
    shiftDisplay(title);
    total = ajaxCalculate("operation4Person/count?key=" + title);
    return total;
}

function loadPerson(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4PersonUl, tabList4Person);
    ajaxRun("operation4Person/list" + params + "&key=" + title, 0, "list" + title + "Div");
}
