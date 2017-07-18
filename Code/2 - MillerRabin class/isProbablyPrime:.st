
!MillerRabin class methodsFor: 'primality testing' stamp: 'len 10/26/2002 16:25'!
isProbablyPrime: p
	| probabilistic |
	probabilistic := self new.
	probabilistic target: p.
	[probabilistic satisfied
		and:
			["error > (1 / 1024)"
			probabilistic iterations < 5]]
		whileTrue: [probabilistic iterate].
	^ probabilistic satisfied! !
