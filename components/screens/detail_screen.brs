sub init()
    m.poster = m.top.findNode("poster")
    doIt()
end sub

sub onContentChangedd(event as Object)
    item = obj.getData()
    m.poster.uri = item.poster_url
    ?"AAAAAAAAAAAAAAAAAAAAAAAAAAA"
end sub

sub doIt()
    content = m.top.findNode("content")
    item = content.getData()
    m.poster.uri = item.poster_url
end sub
