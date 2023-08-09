sub init()
    createcontentNode()
end sub

sub createcontentNode()
    response = ParseJson(ReadAsciiFile("pkg:/components/try.json"))
    if response <> invalid and response.count() > 0
        contentNode = CreateObject("roSGNode","ContentNode")
        for each row in response
            rowNode = contentNode.CreateChild("ContentNode")
            rowNode.rowTitleComponentName = rowNode.title
            for each item in row
                colNode = rowNode.CreateChild("ContentNode")
                colNode.title = item.title
                colNode.HDPosterUrl = item.uri
                colNode.year = item.year
                colNode.rating = item.rating
            end for
        end for
        m.rowlist.content = contentNode
    end if
end sub