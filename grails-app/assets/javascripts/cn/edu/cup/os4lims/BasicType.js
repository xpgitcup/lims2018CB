var operation4BasicTypeDiv;
var tabList4BasicType = ["人员身份", "事情分类"];
var idList4BasicType = ["currentPersonTitle", "currentThingType"];

/*
* 关键函数--初始化页面
* */
$(function () {
    console.info("教师、学生、项目 信息维护...");
    // 静态设置
    operation4BasicTypeDiv = $("#operation4BasicTypeDiv");
    setupTabsWithDivAndPaginationAndTreeview(operation4BasicTypeDiv, tabList4BasicType);
    // 动态设置
    var urlList = ["operation4BasicType/getTreeviewData?key=personTitle", "operation4BasicType/getTreeviewData?key=thingType"]
    setupDataExchangeTabsDiv4TreeView("operation4BasicTypeDiv", tabList4BasicType, urlList);
    setupPaginationParams4TreeView(tabList4BasicType, countBasicType, urlList);
    setupTreeviewNodeSelectFunction(tabList4BasicType, changeUpNode)

    //tabPagesManagerWithTreeViewA("operation4BasicTypeDiv", tabList4BasicType, loadBasicType, countBasicType);
});

function changeUpNode(node) {
    console.info("修改根节点的id...")
    $("#createItem").attr('href', 'javascript: createItem(' + node.attributes[0] + ')');
    $("#createItem").html("创建" + node.attributes[0] + '的子节点');
    $("#currentTitle").html(node.text);
}

function createItem(id) {
    var title = getCurrentTabTitle(operation4BasicTypeDiv);
    switch (title) {
        case "人员身份":
            ajaxRun("operation4BasicType/create?key=personTitle", id, "list" + title + "Div");
            break
        case "事情分类":
            ajaxRun("operation4BasicType/create?key=thingType", id, "list" + title + "Div");
            break
    }
}

function loadBasicType(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    console.info(params)
    switch (title) {
        case "人员身份":
            ajaxRun("operation4BasicType/list?key=personTitle", 0, "");
            break
        case "事情分类":
            ajaxRun("operation4BasicType/list?key=thingType", 0, "");
            break
    }
}

function countBasicType(title) {
    console.info("统计基础数据..." + title);
    showCurrent(title);
    var total = 0;
    switch (title) {
        case "人员身份":
            total = ajaxCalculate("operation4BasicType/count?key=personTitle");
            break
        case "事情分类":
            total = ajaxCalculate("operation4BasicType/count?key=thingType");
            break
    }
    return total;
}

function showCurrent(title) {
    $("#currentTitle").html("请选择...");
}