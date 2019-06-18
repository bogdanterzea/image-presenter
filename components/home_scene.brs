function init()
    m.content_list = m.top.findNode("content_list")
    m.feed_data = m.top.findNode("feed_data")
    runGetComponentDataTask()

end function

sub onComponentChange(feeed)
    feed = feeed.getData()
    labelcontent = createObject("roSGNode","ContentNode")
    for each item in feed
        node = createObject("roSGNode","ContentNode")
        node.HDGRIDPOSTERURL = item.url
        node.id = item.id
        node.HDPosterUrl = item.url
        node.description = item.description
        node.SHORTDESCRIPTIONLINE1 = item.title
        node.SHORTDESCRIPTIONLINE2 = item.description

        labelcontent.appendChild(node)
    end for
    showrowlabel(labelcontent)
end sub

sub showrowlabel(content)
    m.content_list.content=content
    m.content_list.visible=true
    m.content_list.setFocus(true)
end sub

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChange")
    getComponentDataTask.control = "RUN"
end sub

sub onContentDataChange(event as Object)
end sub
