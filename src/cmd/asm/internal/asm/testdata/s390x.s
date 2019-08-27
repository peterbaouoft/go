// Copyright 2016 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include "../../../../../runtime/textflag.h"

TEXT main·foo(SB),DUPOK|NOSPLIT,$16-0 // TEXT main.foo(SB), DUPOK|NOSPLIT, $16-0
	FMOVS	(R1)(R2*1), F0         // 78021000 
	FMOVS	n-8(SP), F15           // edf0f0100064
	FMOVD	-9999999(R8)(R9*1), F8 // c0a1ff67698141aa9000ed8a80000065
	FMOVD	F4, F5                 // 2854
	
	FMOVD	(R1), F0               // 68001000
	FMOVD	4095(R2), F13          // 68d02fff
	FMOVD	4096(R2), F15          // edf020000165

	FMOVS	4095(R2)(R3), F13      // 78d32fff
	FMOVS	4096(R2)(R4), F15      // edf420000164

RET
	RET	foo(SB)

TEXT main·init(SB),DUPOK|NOSPLIT,$0 // TEXT main.init(SB), DUPOK|NOSPLIT, $0
	RET

TEXT main·main(SB),DUPOK|NOSPLIT,$0 // TEXT main.main(SB), DUPOK|NOSPLIT, $0
	BL      main·foo(SB)    // CALL main.foo(SB)
	RET
