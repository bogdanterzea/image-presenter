sub init()
    m.top.functionName = "execute"
end sub

sub execute()
    response = sendRequest("http://my-json-server.typicode.com/cazacutudor/typicode-json-server/photos")

    m.top.component_data = createContentNode(response)
end sub

function sendRequest(url as String) as Object
    roUrlTransfer = CreateObject("roUrlTransfer")
    roUrlTransfer.setUrl(url)

    return roUrlTransfer.getToString()
end function

function createContentNode(response as Object) as Object
    contentNode = CreateObject("roSGNode", "ContentNode")

    return contentNode
end function
