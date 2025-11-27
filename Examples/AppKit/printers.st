"List all available printers"

| printers |

Environment loadModule:'AppKit'.

printers := NSPrinter printerNames.
printers do: 
[ :printer |
    Transcript showLine: printer.
]
