var operation4ThingTypeDiv
var tabList4ThingType = ["项目类型"];

$(function () {
    console.info("项目类型管理...");
    //静态设置
    operation4ThingTypeDiv = $("#operation4ThingTypeDiv");
    setupTabsWithDivAndPaginationAndTreeview(operation4ThingTypeDiv, tabList4ThingType);
    //数据加载
    var urlList = ['operation4ThingType/getTreeViewData']
    setupDataExchangeTabsDiv4TreeView("operation4ThingTypeDiv", tabList4ThingType, urlList);
    setupPaginationParams4TreeView(tabList4ThingType, countBasicType, urlList);
    setupTreeviewNodeSelectFunction(tabList4ThingType, changeUpNode)
});

function changeUpNode(node) {
    console.info("修改根节点的id...")
    $("#createItem").attr('href', 'javascript: createItem(' + node.attributes[0] + ')');
    $("#createItem").html("创建" + node.attributes[0] + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node.attributes[0] + ')');
    $("#editItem").html("编辑" + node.attributes[0] + '节点');
    $("#deleteItem").attr('href', 'operation4ThingType/delete/' + node.attributes[0]);
    $("#deleteItem").html("删除" + node.attributes[0] + '节点');
    $("#currentTitle").html(node.text);
}

function countBasicType(title) {
    console.info("统计基础数据..." + title);
    showCurrent(title);
    var total = 0;
    switch (title) {
        case "项目类型":
            total = ajaxCalculate("operation4ThingType/count");
            break
    }
    return total;
}

function showCurrent(title) {
    $("#currentTitle").html("请选择...");
}

function editItem(id) {
    var title = getCurrentTabTitle(operation4ThingTypeDiv);
    ajaxRun("operation4ThingType/edit", id, "list" + title + "Div");
}

function createItem(id) {
    var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/create", id, "list" + title + "Div");
}