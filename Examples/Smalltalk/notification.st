" Notification example "
[|

main
    | nc |

    nc := NSNotificationCenter defaultCenter.

    Transcript showLine:'Registering for notification'.
    nc addObserver:self selector:#notification: name:'Notification' object:nil.

    Transcript showLine:'Posting notification'.
    nc postNotificationName:'Notification' object:nil.
    
    ^self
!

notification:notif
    
    Transcript showLine:'Notification received'.

    ^self

]
