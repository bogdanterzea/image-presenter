sub init()
    m.itemId = m.top.findNode("item_id")
    m.poster = m.top.findNode("poster")
end sub

sub itemContentChanged(event as Object)
    itemData = event.getData()
    m.itemId.text = itemData.index
    m.poster.uri = itemData.poster_url
end sub
