| array |

array := NSMutableArray array.

1 to: 10000 do: [ :i | array addObject: i].

Transcript showLine:array count.
