// Copyright 2016 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include "../../../../../runtime/textflag.h"

TEXT main·foo(SB),DUPOK|NOSPLIT,$16-0 // TEXT main.foo(SB), DUPOK|NOSPLIT, $16-0
	FMOVS	(R1)(R2*1), F0         // 78021000 
	FMOVS	n-8(SP), F15           // edf0f0100064
	FMOVD	-9999999(R8)(R9*1), F8 // c0a1ff67698141aa9000ed8a80000065
	FMOVD	F4, F5                 // 2854
// op_ld & op_ldy
	FMOVD	(R1), F0               // 68001000
	FMOVD	4095(R2), F13          // 68d02fff
	FMOVD	4096(R2), F15          // edf020000165
// op_le && op_ley
	FMOVS	4095(R2)(R3), F13      // 78d32fff
	FMOVS	4096(R2)(R4), F15      // edf420000164
// op_std && op_stdy
	FMOVD	F0, 4095(R1)           // 60100fff
	FMOVD	F0, 4096(R1)           // ed1000000167
// op_ste && op_stey
	FMOVS	F13, 4095(R2)(R3)      // 70d32fff
	FMOVS	F13, 4096(R2)(R3)      // edd320000166
// op_st && op_sty
	MOVW	R1, 4095(R2)(R3)       // 50132fff
	MOVW	R1, 4096(R2)(R3)       // e31320000150
	MOVWZ	R1, 4095(R2)(R3)       // 50132fff
	MOVWZ	R1, 4096(R2)(R3)       // e31320000150
// op_sth && op_sthy
	MOVH	R1, 4095(R2)(R3)       // 40132fff
	MOVHZ   R1, 4095(R2)(R3)       // 40132fff
	MOVH	R1, 4096(R2)(R3)       // e31320000170
	MOVHZ	R1, 4096(R2)(R3)       // e31320000170
// op_stc && op_stcy
	MOVB	R1, 4095(R2)(R3)       // 42132fff
	MOVBZ	R1, 4095(R2)(R3)       // 42132fff
	MOVB	R1, 4096(R2)(R3)       // e31320000172
	MOVBZ	R1, 4096(R2)(R3)       // e31320000172
	
	RET
	RET	foo(SB)

TEXT main·init(SB),DUPOK|NOSPLIT,$0 // TEXT main.init(SB), DUPOK|NOSPLIT, $0
	RET

TEXT main·main(SB),DUPOK|NOSPLIT,$0 // TEXT main.main(SB), DUPOK|NOSPLIT, $0
	BL      main·foo(SB)    // CALL main.foo(SB)
	RET
