.global _start
_start:
	@ (3.14 2.0 ADD)
	LDR r0, =valor1
	VLDR s0, [r0]
	LDR r1, =valor2
	VLDR s1, [r1]
	VADD.F32 s2, s0, s1
	
	@ (10 3 SUB)
	LDR r0, =valor3
	LDR r2, [r0]
	LDR r1, =valor4
	LDR r3, [r1]
	SUB r4, r2, r3
	
	@ (1.5 2.5 MUL)
	LDR r0, =valor5
	VLDR s3, [r0]
	LDR r1, =valor6
	VLDR s4, [r1]
	VMUL.F32 s5, s3, s4
	
	@ (10 3 IDIV)
	LDR r0, =valor3
	LDR r2, [r0]
	LDR r1, =valor4
	LDR r3, [r1]
	MOV r4, #0
	div_loop1:
	CMP r2, r3
	BLT div_end1
	SUB r2, r2, r3
	ADD r4, r4, #1
	B div_loop1
	div_end1:
	
	@ (10 3 MOD)
	LDR r0, =valor3
	LDR r2, [r0]
	LDR r1, =valor4
	LDR r3, [r1]
	mod_loop2:
	CMP r2, r3
	BLT mod_end2
	SUB r2, r2, r3
	B mod_loop2
	mod_end2:
	MOV r4, r2
	
	@ (2 8 POW)
	LDR r0, =valor7
	LDR r2, [r0]
	LDR r1, =valor8
	LDR r3, [r1]
	MOV r4, #1
	pow_loop3:
	CMP r3, #0
	BEQ pow_end3
	MUL r4, r4, r2
	SUB r3, r3, #1
	B pow_loop3
	pow_end3:
	
	@ (10.5 SOMA)
	LDR r0, =valor9
	VLDR s6, [r0]
	LDR r1, =SOMA
	VSTR s6, [r1]
	
	@ (SOMA)
	LDR r0, =SOMA
	VLDR s7, [r0]
	
	@ (1 1)
	LDR r0, =1
	LDR r2, [r0]
	LDR r1, =res1
	STR r2, [r1]
	
	@ (2.0 3.0 ADD 4.0 1.0 SUB MUL)
	LDR r0, =valor2
	VLDR s8, [r0]
	LDR r1, =valor11
	VLDR s9, [r1]
	VADD.F32 s10, s8, s9
	LDR r0, =valor12
	VLDR s11, [r0]
	LDR r1, =valor13
	VLDR s12, [r1]
	VSUB.F32 s13, s11, s12
	VMOV s14, s10
	VMOV s15, s13
	VMUL.F32 s16, s14, s15
	
	end:
	B end

.data
	res1: .word 0
	valor1: .float 3.14
	valor2: .float 2.0
	valor3: .word 10
	valor4: .word 3
	valor5: .float 1.5
	valor6: .float 2.5
	valor7: .word 2
	valor8: .word 8
	valor9: .float 10.5
	SOMA: .float 0.0
	valor11: .float 3.0
	valor12: .float 4.0
	valor13: .float 1.0
