var operation4PersonDiv;
var tabList4Person = ["教师","学生"];
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

function countPerson(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4Person);

    switch (title) {
        case "教师":
            total = ajaxCalculate("operation4Person/count?key=things4StudentToSelect");
            break;
        case "学生":
            break;
    }
}

function loadPerson(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4PersonUl, tabList4Person);

    switch (title) {
        case "教师":
            ajaxRun("operation4Person/list" + params + "&key=things4StudentToSelect", 0, "list" + title + "Div");
            break;
        case "学生":
            ajaxRun("operation4Person/list" + params + "&key=relatedTeams&thing=" + ids[0], 0, "list" + title + "Div");
            break;
    }
}
