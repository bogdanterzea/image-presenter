sub init()
    m.top.functionName = "execute"
end sub

sub execute()
    response = ParseJSON(transferData())
    createData(response)
end sub

function transferData() as String
    requestTransfer()
    rawResponse = m.request.getToString()

    return rawResponse
end function

sub requestTransfer()
    m.request = CreateObject("roUrlTransfer")
    m.request.setCertificatesFile("common:/certs/ca-bundle.crt")
    m.request.SetUrl(m.top.url)
end sub

sub createData(response as Object)
    m.content = CreateObject("roSGNode", "ContentNode")
    populateData(response)

    m.top.component_data = m.content
end sub

function populateData (response as Object) as Object
    for each item in response
        child_item = CreateObject("roSGNode", "ContentNode")
        child_item.id = item.id
        child_item.description = item.description
        child_item.url = item.url

        m.content.appendChild(child_item)
    end for
end function
