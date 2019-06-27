function init()
    m.ROW_INDEX = 0
    m.ROW_ITEM_INDEX = 1
    m.top.setFocus(true)

    m.top.backgroundURI = "pkg:/images/hexagones.jpg"
    m.contentList = m.top.findNode("content_list")
    m.titleLabel = m.top.findNode("title_label")
    m.descriptionLabel = m.top.findNode("description_label")
    m.contentList.observeField("rowItemFocused", "onRowItemFocused")

    runGetComponentDataTask()
    setTheme()
end function

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChanged")
    getComponentDataTask.control = "RUN"
end sub

sub onContentDataChanged(event as Object)
    m.contentList.content = event.getData()
end sub

sub onRowItemFocused(event as Object)
    rowItemData = getFocusedRowItemData(event.getData())
    m.titleLabel.text = rowItemData.title
    m.descriptionLabel.text = rowItemData.description
end sub

function getFocusedRowItemData(rowItemFocused as Object) as Object
    focusedRow = rowItemFocused[m.ROW_INDEX]
    focusedRowItem = rowItemFocused[m.ROW_ITEM_INDEX]

    return m.contentList.content.getChild(focusedRow).getChild(focusedRowItem)
end function

sub setTheme()
    colors = getAppColors()
    m.titleLabel.color = colors.main
    m.descriptionLabel.color = colors.main
end sub
