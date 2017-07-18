
!CryptoDESTest methodsFor: 'as yet unclassified' stamp: 'rww 7/24/2010 00:10'!
testDESFormal
	| x d |
	x := #(16r94 16r74 16rB8 16rE8 16rC7 16r3B 16rCA 16r7D) asByteArray.
	1 to: 16 do: [:i |
		d := DES key: x.
		(i - 1) even 
			ifTrue: [d encryptBlock: x]
			ifFalse: [d decryptBlock: x] ].
	self assert: x = #(16r1B 16r1A 16r2D 16rDB 16r4C 16r64 16r24 16r38) asByteArray! !
