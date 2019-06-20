sub init()
    m.title = m.top.findNode("title")
    m.itemContent = m.top.findNode("itemContent")
end sub

sub showId()
    m.title.text = m.itemContent.title
end sub
