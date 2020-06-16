sub init()
    m.top.functionName = "execute"
end sub

sub execute()
    response = sendRequest("http://my-json-server.typicode.com/bogdanterzea/json-server/photos")
    m.top.component_data = createContentNode(response)
end sub

function sendRequest(url as String) as Object
    roUrlTransfer = CreateObject("roUrlTransfer")
    roUrlTransfer.setUrl(url)

    return parseJson(roUrlTransfer.getToString())
end function

function createContentNode(response as Object) as Object
    contentNode = CreateObject("roSGNode", "ContentNode")

    rowContentNode = createRowContentNode(response)
    contentNode.appendChild(rowContentNode)

    return contentNode
end function

function createRowContentNode(response as Object) as Object
    rowContentNode = CreateObject("roSGNode", "ContentNode")

    for each itemData in response
        rowItemContentNode = createRowItemContentNode(itemData)
        rowContentNode.appendChild(rowItemContentNode)
    end for

    return rowContentNode
end function

function createRowItemContentNode(itemData as Object) as Object
    rowItemContentNode = CreateObject("roSGNode", "row_item_content_node")
    rowItemContentNode.index = itemData.id
    rowItemContentNode.title = itemData.title
    rowItemContentNode.posterUrl = itemData.url
    rowItemContentNode.description = itemData.description
    rowItemContentNode.largeImageUrl = itemData.image_1080_url

    return rowItemContentNode
end function
