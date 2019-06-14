function init()
    runGetComponentDataTask()
end function

sub runGetComponentDataTask()
    m.getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    m.getComponentDataTask.observeField("component_data", "onContentDataChange")
    m.getComponentDataTask.url = "https://my-json-server.typicode.com/cazacutudor/typicode-json-server/photos"
    m.getComponentDataTask.control = "RUN"
end sub

sub onContentDataChange(event as Object)
    ? event.getData()
end sub
