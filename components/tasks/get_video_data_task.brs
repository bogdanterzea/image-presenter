sub init()
    m.top.functionName = "execute"
end sub

sub execute()
    response = sendRequest("http://my-json-server.typicode.com/bogdanterzea/json-server/videos")
    m.top.video_data = createContentNode(response)
end sub

function sendRequest(url as String) as Object
    roUrlTransfer = CreateObject("roUrlTransfer")
    roUrlTransfer.setUrl(url)

    return parseJson(roUrlTransfer.getToString())
end function

function createContentNode(response as Object) as Object
    contentNode = CreateObject("roSGNode", "ContentNode")

    contentNode.url = response[0].stream.url
    contentNode.title = response[0].title
    contentNode.streamformat = response[0].stream.format

    return contentNode
end function
