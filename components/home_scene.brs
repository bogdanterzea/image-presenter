function init()
	m.title = m.top.findNode("title")

	m.getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
	m.getComponentDataTask.observeField("component_data", "onContentDataChange")
	m.getComponentDataTask.url = "https://my-json-server.typicode.com/cazacutudor/typicode-json-server/photos"
	m.getComponentDataTask.control = "RUN"
end function

sub onContentDataChange(obj)
	? obj.getData()
end sub
