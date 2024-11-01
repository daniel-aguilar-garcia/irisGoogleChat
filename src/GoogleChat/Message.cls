Class GoogleChat.Message
{

Parameter server = "chat.googleapis.com";

Parameter port = 443;

Parameter useHttps = 1;

Parameter sslConf = "ISC.FeatureTracker.SSL.Config";

Parameter contentType = "application/json";

Parameter timeout = 30;

Parameter icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png";

Parameter imageStyle = "IMAGE";

ClassMethod Send(Channel As %String, Title As %String = "", Subtitle As %String = "", Message As %String = "")
{
    Set httpRequest = ..CreateHttpRequest()
    Set message = ..CreateMessage(Channel, Title, Subtitle, Message)

    Set status = httpRequest.EntityBody.Write(message.%ToJSON())
    Set status = httpRequest.Post(..GetUrlChannel(Channel))
    Set result = httpRequest.HttpResponse.StatusCode
    Quit result
}

ClassMethod CreateHttpRequest() As %Net.HttpRequest
{
    Set httpRequest = ##class(%Net.HttpRequest).%New()
    Set httpRequest.Server = ..#server
    Set httpRequest.Port   = ..#port
    Set httpRequest.Https = ..#useHttps
    Set httpRequest.SSLConfiguration = ..#sslConf
    Set httpRequest.Timeout = ..#timeout

    Quit httpRequest
}

ClassMethod CreateMessage(Channel, Title As %String, Subtitle As %String, Message As %String) As %DynamicObject
{
    Set objMessage = {}
    Set objMessage.cards=[]

    Set icon = ..GetIconChannel(Channel)
    Set modChannel = ..GetModChannel(Channel)
    Set modPrompt = ..GetModPromptChannel(modChannel)
    
    If (modPrompt'="")
    {
        
        try{
            Set MessageAux=modPrompt_" "_Message
            Set Message=..AskChatGPT(MessageAux)
        }Catch(e)
        {
            // We will send the original message
        }
    }

    Set objCard={}
    Set objCard.header={}
    Set objCard.header.title=Title
    Set objCard.header.subtitle=Subtitle
    Set objCard.header.imageUrl = icon
    Set objCard.header.imageStyle = ..#imageStyle
    Set objCard.sections=[]
    
    Set objWidgets ={}
    Set objWidgets.widgets=[]
    Set objText={}
    Set objText.textParagraph={}
    Set objText.textParagraph.text = Message
    Do objWidgets.widgets.%Push(objText)

    Do objCard.sections.%Push(objWidgets)
    Do objMessage.cards.%Push(objCard)

    Quit objMessage
}

ClassMethod SaveMod(modName As %String, prompt As %String)
{
    Q:((modName="")!(prompt="")) 0

    Set ^ModsGoogleChat(modName)=prompt
    
    Quit 1
}

ClassMethod DeleteMod(modName As %String)
{
    Q:(modName="") 0

    K ^ModsGoogleChat(modName)
    
    Quit 1
}

ClassMethod CreateChannel(channelName As %String, url As %String, modName As %String = "", icon As %String = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png")
{
    Q:((channelName="")!(url="")!(modName="")) 0

    Set ^GoogleChatChannels(channelName,"url")=url
    Set ^GoogleChatChannels(channelName,"icon")=icon
    Set ^GoogleChatChannels(channelName,"mod")=modName
}

ClassMethod GetUrlChannel(channelName As %String)
{
    Q:(channelName="") ""
    Q $G(^GoogleChatChannels(channelName,"url"))
}

ClassMethod GetIconChannel(channelName As %String)
{
    Q:(channelName="") ""
    Q $G(^GoogleChatChannels(channelName,"icon"))
}

ClassMethod GetModChannel(channelName As %String)
{
    Q:(channelName="") ""
    Q $G(^GoogleChatChannels(channelName,"mod"))
}

ClassMethod GetModPromptChannel(mod As %String)
{
    Q:(mod="") ""
    Q $G(^ModsGoogleChat(mod))
}

ClassMethod AskChatGPT(message As %String) As %String
{
     Set url = "https://api.openai.com/v1/chat/completions"

     Set apiKey = "Your_Chat_Gpt_Api_key"
     Set orgId = "Your_Chat_Gpt_org_id"

     Set request = ##class(%Net.HttpRequest).%New()
     Set request.Server = "api.openai.com"
     Set request.SSLConfiguration = ..#sslConf 
     Set request.Https = 1

     // Headers para la autenticación y configuración de la solicitud
     Do request.SetHeader("Authorization", "Bearer "_apiKey)
     Do request.SetHeader("Content-Type", "application/json")
     Do request.SetHeader("OpenAI-Organization", orgId)

     Set requestBody = {}
     Set requestBody.model = "gpt-4o-mini"
     Set requestMessages = []
     Set requestMessage = {}
     Set requestMessage.role = "user"
     Set requestMessage.question = message
     Do requestMessages.%Push(requestMessage)
     Set requestBody.messages = requestMessages
     Set requestMessage.temperatre = 0.7

     Set requestBodyJSON = requestBody.%ToJSON()
     Do request.EntityBody.Write(requestBodyJSON)

     Set sc = request.Post(url)

     // Manejar la respuesta
     Quit:sc'=1 ""
     
     Set responseObject = ##class(%DynamicAbstractObject).%FromJSON(request.HttpResponse.Data.Read())
    
     Set chatResponse = responseObject.choices.GetAt(1).message.content

     Quit chatResponse
}

}
