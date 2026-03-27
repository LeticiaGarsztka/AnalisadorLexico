.global _start
_start:
	@ (5.0 3.0 ADD 2.0 1.0 SUB MUL)
	LDR r0, =valor1
	VLDR s0, [r0]
	LDR r1, =valor2
	VLDR s1, [r1]
	VADD.F32 s2, s0, s1
	LDR r0, =valor3
	VLDR s3, [r0]
	LDR r1, =valor4
	VLDR s4, [r1]
	VSUB.F32 s5, s3, s4
	VMOV s6, s2
	VMOV s7, s5
	VMUL.F32 s8, s6, s7
	
	@ (10.0 2.0 IDIV 3 1 MOD ADD)
	LDR r0, =valor5
	VLDR s9, [r0]
	LDR r1, =valor3
	VLDR s10, [r1]
	VDIV.F32 s11, s9, s10
	LDR r0, =valor6
	LDR r2, [r0]
	LDR r1, =valor7
	LDR r3, [r1]
	mod_loop1:
	CMP r2, r3
	BLT mod_end1
	SUB r2, r2, r3
	B mod_loop1
	mod_end1:
	MOV r4, r2
	VMOV s12, s11
	VMOV s13, r4
	VADD.F32 s14, s12, s13
	
	@ (100.0 TOTAL)
	LDR r0, =valor8
	VLDR s15, [r0]
	LDR r1, =TOTAL
	VSTR s15, [r1]
	
	@ (TOTAL)
	LDR r0, =TOTAL
	VLDR s16, [r0]
	
	@ (2 2)
	LDR r0, =2
	LDR r2, [r0]
	LDR r1, =res2
	STR r2, [r1]
	
	@ (3.5 MEDIA)
	LDR r0, =valor10
	VLDR s17, [r0]
	LDR r1, =MEDIA
	VSTR s17, [r1]
	
	@ (MEDIA 2.0 1.5 ADD MUL)
	LDR r0, =MEDIA
	VLDR s18, [r0]
	LDR r0, =valor3
	VLDR s19, [r0]
	LDR r1, =valor11
	VLDR s20, [r1]
	VADD.F32 s21, s19, s20
	VMOV s22, s18
	VMOV s23, s21
	VMUL.F32 s24, s22, s23
	
	@ (7 3 POW)
	LDR r0, =valor12
	LDR r2, [r0]
	LDR r1, =valor6
	LDR r3, [r1]
	MOV r4, #1
	pow_loop2:
	CMP r3, #0
	BEQ pow_end2
	MUL r4, r4, r2
	SUB r3, r3, #1
	B pow_loop2
	pow_end2:
	
	@ (-4.5 2.0 ADD)
	LDR r0, =valor13
	VLDR s25, [r0]
	LDR r1, =valor3
	VLDR s26, [r1]
	VADD.F32 s27, s25, s26
	
	@ (5 2 IDIV 3 2 MOD SUB)
	LDR r0, =valor14
	LDR r2, [r0]
	MOV r3, #2
	MOV r4, #0
	div_loop3:
	CMP r2, r3
	BLT div_end3
	SUB r2, r2, r3
	ADD r4, r4, #1
	B div_loop3
	div_end3:
	LDR r0, =valor6
	LDR r2, [r0]
	MOV r3, #2
	mod_loop4:
	CMP r2, r3
	BLT mod_end4
	SUB r2, r2, r3
	B mod_loop4
	mod_end4:
	MOV r4, r2
	MOV r2, r4
	MOV r3, r4
	SUB r4, r2, r3
	
	end:
	B end

.data
	res2: .word 0
	valor1: .float 5.0
	valor2: .float 3.0
	valor3: .float 2.0
	valor4: .float 1.0
	valor5: .float 10.0
	valor6: .word 3
	valor7: .word 1
	valor8: .float 100.0
	TOTAL: .float 0.0
	valor10: .float 3.5
	MEDIA: .float 0.0
	valor11: .float 1.5
	valor12: .word 7
	valor13: .float -4.5
	valor14: .word 5
