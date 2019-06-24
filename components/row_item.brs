sub init()
    m.item_id = m.top.findNode("item_id")
    m.poster = m.top.findNode("poster")
end sub

sub itemContentChanged(event as Object)
    itemData = event.getData()
    m.item_id.text = itemData.id
    m.poster.uri = itemData.FHDGRIDPOSTERURL
end sub
