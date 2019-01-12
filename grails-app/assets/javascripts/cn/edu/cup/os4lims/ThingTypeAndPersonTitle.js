var operation4ThingTypeAndPersonTitleDiv
var tabList4ThingTypeAndPersonTitle = "任务圈";
var thingTypeTree;
var personTitleTree;
var paginationDiv

$(function () {
    console.info("任务圈管理...");

    //静态设置--列表显示
    operation4ThingTypeAndPersonTitleDiv = $("#operation4ThingTypeAndPersonTitleDiv");
    setupPanelDivAndPagination(operation4ThingTypeAndPersonTitleDiv, tabList4ThingTypeAndPersonTitle);
    var cPageNumber = readCookie("currentPage" + tabList4ThingTypeAndPersonTitle, 1)
    var total = countThingTypeAndPersonTitle();
    $("#pagination" + tabList4ThingTypeAndPersonTitle + "Div").pagination({
        pageSize: pageSize,
        total: total,
        pageNumber: cPageNumber,
        onSelectPage: function (pageNumber, pageSize) {
            console.info("setupPaginationParams4TabPage: " + title)
            $.cookie("currentPage" + tabList4ThingTypeAndPersonTitle, pageNumber);
            loadThingTypeAndPersonTitle(pageNumber, pageSize);
        }
    })

    loadThingTypeAndPersonTitle(cPageNumber, pageSize);

    //静态设置--树形结构
    thingTypeTree = $("#thingTypeTree");
    personTitleTree = $("#personTitleTree");

    thingTypeTree.tree({
        url: "operation4ThingType//getTreeViewData",
        onSelect: function (node) {
            $("#thingType").attr("value", node.attributes[0])
        }
    })

    personTitleTree.tree({
        url: "operation4PersonTitle/getTreeViewData",
        onSelect: function (node) {
            $("#personTitle").attr("value", node.attributes[0])
        }
    })
});

function changeUpNode(node) {
    console.info("修改根节点的id...")
    $("#createItem").attr('href', 'javascript: createItem(' + node.attributes[0] + ')');
    $("#createItem").html("创建" + node.attributes[0] + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node.attributes[0] + ')');
    $("#editItem").html("编辑" + node.attributes[0] + '节点');
    $("#deleteItem").attr('href', 'operation4ThingTypeAndPersonTitle/delete/' + node.attributes[0]);
    $("#deleteItem").html("删除" + node.attributes[0] + '节点');
    $("#currentTitle").html(node.text);
    ajaxRun("operation4ThingTypeAndPersonTitle/show", node.attributes[0], "showInformationDiv");
}

function countThingTypeAndPersonTitle() {
    console.info("统计基础数据...");
    var total = 0;
    total = ajaxCalculate("operation4ThingTypeAndPersonTitle/count");
    return total;
}

function loadThingTypeAndPersonTitle() {
    ajaxRun("operation4ThingTypeAndPersonTitle/list", 0, "list" + tabList4ThingTypeAndPersonTitle + "Div");
}
