" talkToServer.stalk

    Server script example
    
    Ussage:
        stalk Server talkToServer.st [message]
"
| message |

((Args count) < 1 ) 
ifTrue: 
    [
        message := 'Hello!'. ^0
    ]
ifFalse:
    [
        message := Args objectAtIndex: 0. ^0
    ].

Server say:message
