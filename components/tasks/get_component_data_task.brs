sub init()
    m.top.functionName = "execute"
end sub

sub execute()
    content = CreateObject("roSGNode", "ContentNode")
    request = CreateObject("roUrlTransfer")
    request.setCertificatesFile("common:/certs/ca-bundle.crt")
    request.SetUrl(m.top.url)
    rawResponse = request.getToString()
    response = ParseJSON(rawResponse)

    for each item in response
        child_item = CreateObject("roSGNode", "ContentNode")
        child_item.id = item.id
        child_item.description = item.description
        child_item.url = item.url

        content.appendChild(child_item)
    end for
    m.top.component_data = content
end sub
