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
    contentPhoto = CreateObject("roSGNode", "ContentNode")
    contentPhoto.title = "PHOTOS"

    contentVideo = CreateObject("roSGNode", "ContentNode")
    contentVideo.title = "VIDEOS"

    for each item in response
        contentPhotoChild = CreateObject("roSGNode", "contentNode")
        contentPhotoChild.FHDGRIDPOSTERURL = item.url
        contentPhotoChild.title = item.title
        contentPhotoChild.description = item.description
        contentPhoto.appendChild(contentPhotoChild)
    end for

    contentNode.appendChild(contentPhoto)
    contentNode.appendChild(contentVideo)

    return contentNode
end function
