" listFonts.st

    Example that will create a 'rtf file containing smaples of all available 
    fonts.

"

[| :text

main

    | fontManager |

    Environment loadModule:'AppKit'.

    text := NSTextView alloc initWithFrame:NSNullRect.
    text setRichText:YES.

    fontManager := NSFontManager sharedFontManager.

    (fontManager availableFontFamilies) 
    do: [ :font |
        self addFontSample:font
    ].

    text writeRTFDToFile:'Fonts.rtf' atomically:YES.

    ^nil
!    

addFontSample:fontName
    
    | attr |

    attr := NSMutableDictionary dictionary.
    attr setObject:(NSFont fontWithName:fontName size:0) 
             forKey:NSFontAttributeName.

    text setTypingAttributes:attr.
    text insertText:(fontName,'\n').
    
    ^self


]
