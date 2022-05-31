sub init()
    m.video = m.top.findNode("video")
end sub

sub onContentChanged(event as Object)
    content = event.getData()
    populateVideo(content)
end sub

sub populateVideo(content)
    m.video.content = content
    m.video.control = "play"
end sub