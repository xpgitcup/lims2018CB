var operation4PersonTitleDiv
var tabList4PersonTitle = ["人员类型"];

$(function () {
    console.info("人员类型管理...");
    //静态设置
    operation4PersonTitleDiv = $("#operation4PersonTitleDiv");
    setupTabsWithDivAndPaginationAndTreeview(operation4PersonTitleDiv, tabList4PersonTitle);
    //数据加载
    var urlList = ['operation4PersonTitle/getTreeViewData']
    setupDataExchangeTabsDiv4TreeView("operation4PersonTitleDiv", tabList4PersonTitle, urlList);
    setupPaginationParams4TreeView(tabList4PersonTitle, countBasicType, urlList);
    setupTreeviewNodeSelectFunction(tabList4PersonTitle, changeUpNode)
});

function changeUpNode(node) {
    console.info("修改根节点的id...")
    $("#createItem").attr('href', 'javascript: createItem(' + node.attributes[0] + ')');
    $("#createItem").html("创建" + node.attributes[0] + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node.attributes[0] + ')');
    $("#editItem").html("编辑" + node.attributes[0] + '节点');
    $("#deleteItem").attr('href', 'operation4PersonTitle/delete/' + node.attributes[0]);
    $("#deleteItem").html("删除" + node.attributes[0] + '节点');
    $("#currentTitle").html(node.text);
}

function countBasicType(title) {
    console.info("统计基础数据..." + title);
    showCurrent(title);
    var total = 0;
    switch (title) {
        case "人员类型":
            total = ajaxCalculate("operation4PersonTitle/count");
            break
    }
    return total;
}

function showCurrent(title) {
    $("#currentTitle").html("请选择...");
}

function editItem(id) {
    var title = getCurrentTabTitle(operation4PersonTitleDiv);
    ajaxRun("operation4PersonTitle/edit", id, "list" + title + "Div");
}

function createItem(id) {
    var title = getCurrentTabTitle(operation4PersonTitleDiv);
    //ajaxRun("operation4PersonTitle/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4PersonTitle/create", id, "list" + title + "Div");
}