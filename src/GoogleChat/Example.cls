Class GoogleChat.Example Extends %RegisteredObject
{

ClassMethod testSetup()
{
        //Setup Google Chat (only needed first time)
        Set url    ="https://api.openai.com/v1/chat/completions"

        // Provide your custom Data here
        Set apiKey ="your OpenAi API key"
        Set orgId  ="your OpenAi organization ID"

        
        Do ##class(GoogleChat.Message).SetupGoogleChat(url, apiKey, orgId)

        // Mod angry (only needed first time)
        Set modName="angry"
        Set modPrompt="Generate a message to alert about the error, blaming me with a touch of sarcastic humor, without being insulting. The subject should be 'you.' Return only the text, without emojis or titles. This is the alert message:  "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName

        // Provide your custom Data
        Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

        // Mod carefree (only needed first time)
        Set modName="carefree"
        Set modPrompt="Generate an error alert message, acting with an carefree behavior with a touch of sarcastic and not blaming me for it. Add a touch of humor. You are only responsible to notify. Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
         Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

         // Mod Tiboroski (The Simpsons fans will understand xD) (only needed first time)
        Set modName="tiboroski"
        Set modPrompt="Generate an error alert message, acting with an carefree behavior with a touch of sarcastic and blaming to Tiboroski for it you can be rude. Add a touch of humor. You are only responsible to notify. Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
        Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

        // Mod lazy (only needed first time)
        Set modName="lazy-angry"
        Set modPrompt="Generate a message to alert about the error, act as if you were a really lazy person that doesn't like work and I'm currently making work with this alert with a touch of sarcastic humor, . The subject should be 'you.' Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
        Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

        // Mod lazy (only needed first time)
        Set modName="overly-considerate"
        Set modPrompt="Generate an error alert message, acting as if you were the most tactful person in the world and felt bad about bothering with alerts because you know I'm very worried. Add a touch of humor. Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
        Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

                // Mod lazy (only needed first time)
        Set modName="passive-agresive"
        Set modPrompt="Generate an error alert message, acting with an aggressive-passive behavior with a touch of sarcastic and blaming me for it. Add a touch of humor. You are only responsible to notify. Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
        Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

        // Mod lazy (only needed first time)
        Set modName="drama"
        Set modPrompt="Generate an error alert message, acting with an Super dramatic attitude that exaggerates everything a lot behavior with a touch of sarcastic and blaming me for it. Add a touch of humor. You are only responsible to notify. Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
        Set url="/v1/spaces/AAAAJP9Vp7E/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKvRMnmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)

        // Mod poem (only needed first time)
        Set modName="poem"
        Set modPrompt="Generate an error alert message, making a tacky poem with a touch of sarcastic and blaming me for it. Add a touch of humor. You are only responsible to notify. Return only the text, without emojis or titles. This is the alert message: "
        Do ##class(GoogleChat.Message).SaveMod(modName, modPrompt)

        Set channelName="alertChannel-"_modName
        Set url="/v1/spaces/AAAAJP943ffE/messages?key=AIzaSyDdI0hCmsnd6vySjMm-WEfRq3CPzqKqqsHI&token=RKjvKv934kfmdJbuyCoyGslos0Qce23Fd-P12lZtkUVN0"
        Set icon = "https://fonts.gstatic.com/s/e/notoemoji/14.0/1f534/32.png"
        Do ##class(GoogleChat.Message).CreateChannel(channelName,url,modName,icon)
}

ClassMethod testMods()
{

        For channel="alertChannel-angry","alertChannel-carefree","alertChannel-tiboroski","alertChannel-poem","alertChannel-drama","alertChannel-lazy-angry","alertChannel-overly-considerate","alertChannel-passive-agresive" D
        .
        . //Finaly let's send a message
        .Set title=$P(channel,"-",2,*)
        .Set subtitle = "Warning Alert!!"
        .Set message = "The task 1001 has failed - Error Divide 0"
        .Do ##class(GoogleChat.Message).Send(channel, title, subtitle, message)
}

}
