Class GoogleChat.Example Extends %RegisteredObject
{

ClassMethod testExample()
{
        // First create the mod (only needed first time)
        Set modName="angry"
        Set modPrompt="I'll send you a message with an error; you need to generate an alert message to send to an alert chat, but I want you to blame me for the error and insult me the subject must be 'you'. only return the text without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        // Now the channel (only needed first time)
        Set channel="alertChannel"
        Set url = "your_Google_Chat_Webhook_Url"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channel,url,modName,icon)

        //Finaly let's send a message
        Set title="Server Name XX"
        Set subtitle = "Warning Alert!!"
        Set message = "The task 1001 has failed - Error Divide 0"
        Do ##class(GoogleChat.Message).Send(channel, title, subtitle, message)
}

}
