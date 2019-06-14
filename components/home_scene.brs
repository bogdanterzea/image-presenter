function init()
    m.title = m.top.findNode("title")
    m.title.text = "HELLO!"

    runComponentDataTask()
end function

sub runComponentDataTask()
    m.getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    m.getComponentDataTask.observeField("component_data", "onContentDataChange")
    m.getComponentDataTask.url = "https://my-json-server.typicode.com/cazacutudor/typicode-json-server/photos"
    m.getComponentDataTask.control = "RUN"
end sub

sub onContentDataChange(component_data)
    ? component_data
end sub
