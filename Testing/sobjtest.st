"   Test for script objects.

    Author: Stefan Urbanek
    Date: 2003 Aug 6 
"

| object method source engine |

    Environment includeFramework:'StepTalk'.

" Create a script object and set it's environment " 
    object := STScriptObject scriptObject.
    object setEnvironment:Environment.
    
" This is the source of new method "
    source := 'sayHi Transcript showLine: \'Hi.\'. ^self'.

" Get the proper engine "
    engine := STEngine engineForLanguageWithName:'Smalltalk'.

" Create method "
    method := engine methodFromSource:source 
                          forReceiver:object
                        inEnvironment:Environment.

" Add the method to the object "
    object addMethod:method.

" Sent it! "
    object sayHi.
    
    
