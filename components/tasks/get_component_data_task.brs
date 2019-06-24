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

    return parseJson(roUrlTransfer.getToString())
end function

function createContentNode(response as Object) as Object
    contentNode = CreateObject("roSGNode", "ContentNode")
    m.contentPhoto = CreateObject("roSGNode", "ContentNode")
    m.contentPhoto.title = "PHOTOS"
    giveChildData(response)
    contentNode.appendChild(m.contentPhoto)

    return contentNode
end function

sub giveChildData(response as Object)
    for each item in response
        contentPhotoChild = CreateObject("roSGNode", "contentNode")
        contentPhotoChild.id = item.id
        contentPhotoChild.FHDGRIDPOSTERURL = item.url
        contentPhotoChild.title = item.title
        contentPhotoChild.description = item.description
        m.contentPhoto.appendChild(contentPhotoChild)
    end for

end sub
