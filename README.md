# IrisGoogleChat

## Introduction

**IrisGoogleChat** is a utility for **InterSystems IRIS** that allows seamless message integration with **Google Chat** using Cache ObjectScript. This application provides a set of tools to configure channels, create and format messages, and manage message styles or "personalities" that you can apply to your messages.

## Some Examples:

### Passive-Agressive
![Passive Agresive Example](/messagesExample/passive-agresive1.png)

### Carefree
#
![Carefree Example](/messagesExample/carefree1.png)

### Lazy-Angry
![Carefree Example](/messagesExample/lazyAngry1.png)

### Drama
![Carefree Example](/messagesExample/drama1.png)

### Poem
![Carefree Example](/messagesExample/poem1.png)

### Tiboroski (only for Simpsons fans)
![Carefree Example](/messagesExample/tiboroski.png)





## Useful Commands

Below is a list of the main commands that you can find in the **Message.cls** class and a brief description of their functions:

- **`Send`**: Sends a message to a specified Google Chat channel.
- **`CreateMessage`**: Accepts a channel, title, subtitle, and main message body, then returns a JSON object formatted to Google Chat's requirements for sending messages.
- **`SaveMod`**: Saves a "personality" style that can be applied to messages for customization.
- **`DeleteMod`**: Deletes an existing personality.
- **`CreateChannel`**: Saves the configuration details for a new Google Chat channel.
- **`GetUrlChannel`**: Retrieves the URL of a specified channel.
- **`GetIconChannel`**: Retrieves the icon associated with a specific channel.
- **`GetModChannel`**: Retrieves the personality style associated with a specific channel.
- **`SetupGoogleChat`**: Initializes and stores configuration details required for sending messages to Google Chat.

### You could find some useful 'How to use' examples in the **Example.cls** class

## Description

**IrisGoogleChat** methods:

### Send

The `Send` method allows you to directly send a message to a Google Chat channel. This method is central to the application’s functionality, enabling real-time communication with teams or services via Google Chat.

### CreateMessage

This method receives details such as a channel identifier, title, subtitle, and main message body. It then formats these details into a JSON object compatible with Google Chat’s message structure requirements. This JSON object can then be sent via the `Send` method.

### SaveMod

`SaveMod` saves a customizable "personality" for messages. These personalities can be applied to messages to give them a unique style or tone, making communication more engaging and recognizable.

### DeleteMod

Deletes an existing personality style from the saved personalities.

### CreateChannel

The `CreateChannel` method stores configuration details for Google Chat channels, including settings like URL and icons. This method allows easy setup for multiple channels, enabling targeted messaging across different channels within Google Chat.

### GetUrlChannel

Retrieves the URL for a given channel, allowing you to quickly reference and send messages to specific channels as needed.

### GetIconChannel

This method returns the icon associated with a channel. Icons help identify channels visually, making it easier for users to recognize the origin of messages in Google Chat.

### GetModChannel

Retrieves the personality style associated with a given channel, so that messages sent to that channel can have a consistent look and feel.

### SetupGoogleChat

This method sets up and stores the necessary configuration details to enable Google Chat messaging, including authentication and API endpoint configurations, simplifying the initialization process.
