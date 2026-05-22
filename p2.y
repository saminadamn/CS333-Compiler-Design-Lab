20: t1 := c + a
21: t2 := b * t1
22: if t2>d goto __
23: goto __
24: if x goto __
25: goto __
Backpatch : Resolve targets in 23, With label : 24
26: if y goto __
27: goto __
28: if c!=d goto __
29: goto __
Backpatch : Resolve targets in 27, With label : 28
Backpatch : Resolve targets in 22, 24, With label : 26
Truelist after processing 26, 28, 
Falselist after processing 25, 29, 
