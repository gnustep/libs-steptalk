| fileManager path files dict |

fileManager := NSFileManager defaultManager.

path := fileManager currentDirectoryPath.

Transcript showLine:( 'Listing of directory: ', path ).

files := fileManager directoryContentsAtPath:path.

files do:
    [ :file |

        dict := fileManager fileAttributesAtPath: (path / file)
                            traverseLink:NO.
        Transcript showLine:file.

        Transcript showLine: ('    Type: ', (dict @ NSFileType)).
        Transcript showLine: ('    Size: ', ((dict @ NSFileSize) stringValue)).
        Transcript showLine: ('    Date: ', ((dict @ NSFileModificationDate) 
                                                                  description)).

        Transcript showLine:''
    ]


