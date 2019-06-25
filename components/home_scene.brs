function init()
    m.ROW_INDEX = 0
    m.ROW_ITEM_INDEX = 1

    m.top.backgroundURI = "pkg:/images/hexagones.jpg"
    m.content_list = m.top.findNode("content_list")
    m.title_label = m.top.findNode("title_label")
    m.description_label = m.top.findNode("description_label")
    m.content_list.setFocus(true)
    m.content_list.observeField("rowItemFocused", "onRowItemFocused")

    runGetComponentDataTask()
end function

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChanged")
    getComponentDataTask.control = "RUN"
end sub

sub onContentDataChanged(event as Object)
    m.content_list.content = event.getData()
end sub

sub onRowItemFocused(event as Object)
    rowItemData = getFocusedRowItemData(event.getData())
    m.title_label.text = rowItemData.title
    m.description_label.text = rowItemData.description
end sub

function getFocusedRowItemData(rowItemFocused as Object) as Object
    focusedRow = rowItemFocused[m.ROW_INDEX]
    focusedRowItem = rowItemFocused[m.ROW_ITEM_INDEX]

    return m.content_list.content.getChild(focusedRow).getChild(focusedRowItem)
end function
