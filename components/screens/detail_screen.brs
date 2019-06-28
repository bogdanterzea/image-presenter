sub init()
    m.poster = m.top.findNode("poster")
    m.detailScreen = m.top.findNode("detail_screen")
end sub

sub onContentChanged(event as Object)
    item = event.getData()
    m.poster.uri = item.poster_url
    m.poster.visible = true
end sub
