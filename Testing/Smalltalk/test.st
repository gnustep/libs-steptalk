[| :array

main
    
    array := #(A B C D E F G H).
    
    self testBlock.
    self testExceptions.
    ^self
    
!    

testBlock
    | count |

    Transcript showLine:'> Block test'.
    
    count := 0.
    array do: [ :element | count := count + 1. ].

   Transcript showLine:'    Count ', (count stringValue).
    ^self
    
    
!

testExceptions
    
    Transcript showLine:'> Exception handler test'.

    [ NSException raise:'Some exception' format:' '. ] 
    handler:
    [ :localException |
        Transcript showLine:('    Exception: ', localException name).
    ].

    ^self
]
