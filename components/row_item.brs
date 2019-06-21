sub init()
    m.itemId = m.top.findNode("itemId")
    m.poster = m.top.findNode("poster")
end sub

sub itemContentChanged(event as Object)
    itemData = event.getData()
    m.itemId.text = itemData.id
    m.poster.uri = itemData.FHDGRIDPOSTERURL
end sub
