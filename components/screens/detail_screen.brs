sub init()
    m.poster = m.top.findNode("poster")
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
    m.rectangle = m.top.findNode("rectangle")
end sub

sub onContentChanged(event as Object)
    content = event.getData()
    m.poster.uri = content.poster_url
    m.title.text = content.title
    m.description.text = content.description
    m.rectangle.visible = true
    
    setTheme()
end sub

sub setTheme()
    colors = getAppColors()
    m.title.color = colors.main
    m.description.color = colors.main
    m.rectangle.color = colors.rectangleMain
end sub
