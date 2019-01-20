var operation4QueryStatementDiv;
var operation4QueryStatementUl;
var tabList4QueryStatement = ["查询配置"]

$(function() {
    console.info("查询维护...");

    operation4QueryStatementUl = $("#operation4QueryStatementUl");
    operation4QueryStatementDiv = $("#operation4QueryStatementDiv");

    setupDisplayUl(operation4QueryStatementUl, tabList4QueryStatement)

    setupTabsWithDivAndPagination(operation4QueryStatementDiv, tabList4QueryStatement);
    setupTabPageParams("operation4QueryStatementDiv", countQueryStatement, loadQueryStatement);

});

function countQueryStatement(title) {
    console.info("统计数据...");
    var total = ajaxCalculate("operation4QueryStatement/count?key=" + title);
    return total;
}

function loadQueryStatement(title, page, pageSize) {
    console.info("list数据...");
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4QueryStatement/list" + params + "&key=" + title, 0, "list" + title + "Div");
}