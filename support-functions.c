90: t1 := b + c 
91: if t1>d goto ___ 
92: goto  ___
93: goto  ___ 
Backpatch : Resolve targets in 92,  With label : 93 
94: if b!=c goto ___ 
95: goto ___ 
Backpatch : Resolve targets in 91,  With the label : 94 
 Truelist after processing 94, 
 Falselist after processing 93, 95, 
96: t2 := b + c
97: a := t2
98: goto ___
99: t3 := b * c
100: a := t3
Backpatch : Resolve targets in 94, With the label : 96
Backpatch : Resolve targets in 93, 95 With the label : 99
Backpatch : Resolve targets in 98 With the label : 101


