" hello.st

  Ussage:
      stexec hello.st name
"

((Args count) < 1 ) 
ifTrue: 
    [
        Transcript showLine:'Hello ... who?'
    ]
ifFalse:
    [
        " See ..../Library/StepTalk/Environments/Foundation-operators.stenv 
          or Source/Environments/Foundation-operators.stenv
        "

        Transcript showLine: ('Hello ', (Args @ 0), '!').
    ]
