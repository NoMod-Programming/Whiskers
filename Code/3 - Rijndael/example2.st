

!Rijndael methodsFor: 'examples' stamp: 'RJT 7/6/2006 21:31'!

example2

	| k pt r |

	k := #(16r2B 16r7E 16r15 16r16 16r28 16rAE 16rD2 16rA6 16rAB 16rF7 16r15 16r88 16r09 16rCF 16r4F 16r3C).

	pt := #(16r32 16r43 16rF6 16rA8 16r88 16r5A 16r30 16r8D 16r31 16r31 16r98 16rA2 16rE0 16r37 16r07 16r34).



	pt := self stateFromBytes: pt.

	self key: k.

	r := Time millisecondsToRun: 

		[10000 timesRepeat: [self encryptState: pt]].

	^ r

! !

