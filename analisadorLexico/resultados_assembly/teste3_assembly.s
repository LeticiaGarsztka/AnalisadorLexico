.global _start
_start:
	@ (3.14 2.0 ADD)
	LDR r0, =valor1
	VLDR s0, [r0]
	LDR r1, =valor2
	VLDR s1, [r1]
	VADD.F32 s2, s0, s1
	
	@ (50.0 ACUMULADOR)
	LDR r0, =valor3
	VLDR s3, [r0]
	LDR r1, =ACUMULADOR
	VSTR s3, [r1]
	
	@ (ACUMULADOR)
	LDR r0, =ACUMULADOR
	VLDR s4, [r0]
	
	@ (3)
	
	@ (4.0 2.0 MUL 1.0 0.5 ADD SUB)
	LDR r0, =valor5
	VLDR s5, [r0]
	LDR r1, =valor2
	VLDR s6, [r1]
	VMUL.F32 s7, s5, s6
	LDR r0, =valor6
	VLDR s8, [r0]
	LDR r1, =valor7
	VLDR s9, [r1]
	VADD.F32 s10, s8, s9
	VMOV s11, s7
	VMOV s12, s10
	VSUB.F32 s13, s11, s12
	
	@ (9 3 IDIV)
	LDR r0, =valor8
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
	
	@ (11 4 MOD)
	LDR r0, =valor9
	LDR r2, [r0]
	LDR r1, =valor10
	LDR r3, [r1]
	mod_loop2:
	CMP r2, r3
	BLT mod_end2
	SUB r2, r2, r3
	B mod_loop2
	mod_end2:
	MOV r4, r2
	
	@ (2 6 MUL)
	LDR r0, =valor11
	LDR r2, [r0]
	LDR r1, =valor12
	LDR r3, [r1]
	MUL r4, r2, r3
	
	@ (7 5 IDIV)
	LDR r0, =valor13
	LDR r2, [r0]
	LDR r1, =valor14
	LDR r3, [r1]
	MOV r4, #0
	div_loop3:
	CMP r2, r3
	BLT div_end3
	SUB r2, r2, r3
	ADD r4, r4, #1
	B div_loop3
	div_end3:
	
	@ (7 SOMA)
	LDR r0, =valor13
	LDR r2, [r0]
	LDR r1, =SOMA
	STR r2, [r1]
	
	end:
	B end

.data
	valor1: .float 3.14
	valor2: .float 2.0
	valor3: .float 50.0
	ACUMULADOR: .float 0.0
	valor4: .word 3
	valor5: .float 4.0
	valor6: .float 1.0
	valor7: .float 0.5
	valor8: .word 9
	valor9: .word 11
	valor10: .word 4
	valor11: .word 2
	valor12: .word 6
	valor13: .word 7
	valor14: .word 5
	SOMA: .float 0.0
