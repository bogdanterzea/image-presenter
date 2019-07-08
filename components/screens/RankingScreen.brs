sub init()
    m.background = m.top.findNode("background")
    m.rectangle = m.top.findNode("rectangle")
    m.text = m.top.findNode("text")

    setTheme()
end sub

sub onContentChanged(event as Object)
    content = event.getData()
    m.background.uri = content.poster_url
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
