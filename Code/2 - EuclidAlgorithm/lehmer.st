
!EuclidAlgorithm methodsFor: 'as yet unclassified' stamp: 'dik 9/28/2010 14:01'!
lehmer
	"For a desciption of the algorithm below for large integers See 'A Course in Computational Algebraic 
	Number Theory' by Henri Cohen"

	"do Preprocessing"
	| a0 b0 a1 b1 aHat bHat higher aa bb cc dd q t r v1 bcc bdd quoRem e k |
	b1 := b abs.
	a1 := a abs max: b1.
	b1 := a abs min: b1.
	a0 := a1.
	b0 := b1.	"Initialize elements"
	u := 1.
	v1 := 0.
	aa := 1.
	bb := 0.
	cc := 0.
	dd := 1.
	higher := 30. "Core.SmallInteger maxVal highBit."
	["Are we done yet"
	b1 class == SmallInteger]
		whileFalse: 
			[aHat := a1.
			k := higher - a1 highBit.
			(aHat bitShift: k) class == SmallInteger
				ifFalse: 
					[k := k - 1.
					aHat := aHat bitShift: -1].
			bHat := b1 bitShift: k.
			
			["Test the quotient"
			bcc := bHat + cc.
			bcc ~= 0
				and: 
					[bdd := bHat + dd.
					bdd ~= 0
						and: 
							[q := aHat + a1 // bcc.
							q = (aHat + bb // bdd)]]]
				whileTrue: 
					["Euclidean step"
					aa := cc.
					cc := aa - (q * aa).
					bb := dd.
					dd := bb - (q * bb).
					aHat := bHat.
					bHat := aHat - (q * aHat)].
			bb = 0
				ifTrue: 
					["Multi-precision step"
					quoRem := a1 digitDiv: b1 neg: false.
					a1 := b1.
					b1 := quoRem at: 2.
					u := v1.
					v1 := u - ((quoRem at: 1)
									* u)]
				ifFalse: 
					[t := aa * a1 + (bb * b1).
					r := cc * a1 + (dd * b1).
					a1 := t.
					b1 := r.
					t := aa * u + (bb * v1).
					r := cc * u + (dd * v1).
					u := t.
					v1 := r]].
	e := self class with: a1 with: b1.
	e doBasicAlgorithm.
	gcd := e gcd.
	u := u * e firstCoefficient + (v1 * e secondCoefficient).
	v := b0 = 0
				ifTrue: [b0]
				ifFalse: [gcd - (u * a0) // b0].
	a abs >= b abs
		ifFalse: 
			["Postprocess"
			t := u.
			u := v.
			v := t].
	a < 0 ifTrue: [u := u negated].
	b < 0 ifTrue: [v := v negated]! !
