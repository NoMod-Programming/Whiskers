
!PrimesWheel methodsFor: 'arithmetic' stamp: 'len 10/26/2002 16:19'!
+= anInteger
	| s r |
	s := true.
	1 to: primes size do: [:i |
		r := (residues at: i) + anInteger \\ (primes at: i).
		residues at: i put: r.
		r isZero ifTrue: [s := false]].
	satisfied := s! !
