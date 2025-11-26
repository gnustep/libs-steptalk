" listFonts.st

    Example that will create an 'rtfd file containing smaples of all available 
    fonts.

"

[| :text

main

    | fontManager |

    Environment loadModule:'AppKit'.

    frame := STStructure structureWithX: 0 y: 0 width: 1000 height: 100.
    Transcript showLine: frame.
    text := NSTextView alloc initWithFrame: frame.
    text setRichText:YES.
    text setString: ' '.

    fontManager := NSFontManager sharedFontManager.

    (fontManager availableFonts) 
    do: [ :font |
        self addFontSample:font
    ].

    text writeRTFDToFile:'Fonts.rtfd' atomically:YES.

    ^nil
!    

addFontSample:fontName
    
    | attr font |

    Transcript showLine:fontName.

    attr := NSMutableDictionary dictionary.
    font := (NSFont fontWithName:fontName size:36).
    
    (font isNil) ifFalse:
    [
    attr setObject:font forKey:NSFontAttributeName.
    text setTypingAttributes:attr.
    text insertText:(fontName,'\n').
    ].
    ^self

]
