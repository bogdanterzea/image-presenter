sub init()
    m.ROW_INDEX = 0
    m.ROW_ITEM_INDEX = 1
    m.container = m.top.findNode("container")
    m.titleLabel = m.top.findNode("title_label")
    m.contentList = m.top.findNode("content_list")
    m.actionButton = m.top.findNode("action_button")
    m.descriptionLabel = m.top.findNode("description_label")

    m.rankDisplayText = m.top.findNode("rank_display_text")
    m.rankDisplayRectangle = m.top.findNode("rank_display_rectangle")

    m.contentList.observeField("rowItemFocused", "onRowItemFocused")
    m.contentList.observeField("rowItemSelected", "onRowItemSelected")
    m.actionButton.observeField("buttonSelected", "onActionButtonSelected")

    runGetComponentDataTask()
    setTheme()
end sub

sub onActionButtonSelected(event as Object)
    navigate("VideoScreen", m.videoData)
end sub

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChanged")
    getComponentDataTask.control = "RUN"

    getVideoDataTask = CreateObject("roSgNode", "get_video_data_task")
    getVideoDataTask.observeField("video_data","onVideoDataChanged")
    getVideoDataTask.control = "RUN"
end sub

sub onRowItemSelected(event as Object)
    rowItemData = getRowItemData(event.getData())
    navigate("DetailScreen", rowItemData)
end sub

sub onRowItemFocused(event as Object)
    initializeRegistry(m.content)
    rowItemData = getRowItemData(event.getData())
    m.titleLabel.text = rowItemData.title
    m.descriptionLabel.text = rowItemData.description
    displayCurrentRank(event.getData())
end sub

sub initializeRegistry(content as Object)
    m.registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")
    m.registryAssocArray = parseJson(m.registrySectionContent.Read("registry"))
end sub

sub displayCurrentRank(event as Object)
    rowNumber = event[1] + 1
    m.rankDisplayRectangle.visible = "false"
    for each item in m.registryAssocArray
        if item = rowNumber.ToStr()
            m.rankDisplayText.text = "Current rank: "+ m.registryAssocArray[item].rank.ToStr()
            m.rankDisplayRectangle.visible = "true"
        end if
    end for
end sub

sub onContentDataChanged(event as Object)
    m.contentList.content = event.getData()
end sub

sub onVideoDataChanged(event as Object)
    m.videoData = event.getData()
end sub

function getRowItemData(rowItemFocused as Object) as Object
    focusedRow = rowItemFocused[m.ROW_INDEX]
    focusedRowItem = rowItemFocused[m.ROW_ITEM_INDEX]

    return m.contentList.content.getChild(focusedRow).getChild(focusedRowItem)
end function

sub setTheme()
    colors = getAppColors()
    m.container.color = colors.transparentBlack
    m.rankDisplayRectangle.color = colors.transparentBlack
end sub

function onKeyDown() as Boolean
    if m.contentList.hasFocus() then m.actionButton.setFocus(true)

    return true
end function

function onKeyUp() as Boolean
    if m.actionButton.hasFocus() then m.contentList.setFocus(true)

    return true
end function
