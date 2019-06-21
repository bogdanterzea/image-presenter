sub init()
    m.title = m.top.findNode("title")
    m.poster = m.top.findNode("poster")
end sub

sub itemContentChanged(event as Object)
    itemData = event.getData()
    m.title.text = itemData.id
    m.poster.uri = itemData.FHDGRIDPOSTERURL
end sub
