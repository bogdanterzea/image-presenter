function init()
	m.title = m.top.findNode("title")
	m.content_grid = m.top.findNode("content_grid")

	loadFeed("https://my-json-server.typicode.com/cazacutudor/typicode-json-server/photos")

end function

sub loadFeed(url)
	m.feed_task = CreateObject("roSGNode", "load_feed_task")
	m.feed_task.observeField("response","onFeedResponse")
	m.feed_task.url = url
	m.feed_task.control = "RUN"
end sub

sub onFeedChanged(obj)
	feed = obj.getData()
	m.title.text="INCERC ACI"
	postercontent = CreateObject("roSGNode", "ContentNode")
	for each item in feed
		node = CreateObject("roSGNode", "ContentNode")
		node.id = item.id
		node.HDPosterUrl = item.url
		node.description = item.description
		node.SHORTDESCRIPTIONLINE1 = item.title
		node.SHORTDESCRIPTIONLINE2 = item.description

		postercontent.appendChild(node)
	end for
	m.content_grid.content = postercontent
	m.content_grid.visible = true
	m.content_grid.setFocus(true)
end sub

sub showpostergrid(content)
	m.content_grid.content = content
	m.content_grid.visible = true
	m.content_grid.setFocus(true)
end sub
