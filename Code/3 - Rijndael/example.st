
!Rijndael methodsFor: 'examples' stamp: 'len 8/21/2002 16:15'!
example
	| k pt |
	k := #(16r2B 16r7E 16r15 16r16 16r28 16rAE 16rD2 16rA6 16rAB 16rF7 16r15 16r88 16r09 16rCF 16r4F 16r3C).
	pt := #(16r32 16r43 16rF6 16rA8 16r88 16r5A 16r30 16r8D 16r31 16r31 16r98 16rA2 16rE0 16r37 16r07 16r34).

	k :=  #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0).
	pt := #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0).

	pt := self stateFromBytes: pt.
	self key: k.
	3 timesRepeat: 
		[Transcript show: pt; cr.
		self encryptState: pt].
	3 timesRepeat: 
		[Transcript show: pt; cr.
		self decryptState: pt].
	Transcript show: pt; cr.! !
