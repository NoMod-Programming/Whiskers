
!PrimesWheel methodsFor: 'initialization' stamp: 'LC 1/16/2002 08:06'!
initializePrimes: n
	| primes2000 last p |
	primes2000 := self class primes2000.
	n = 2000
		ifTrue:
			[primes := primes2000.
			^ self].
	n < 2000
		ifTrue:
			[last := primes2000 findLast: [:prime | prime <= n].
			primes := primes2000 copyFrom: 1 to: last.
			^ self].
	primes := (OrderedCollection new: n // 2) addAll: primes2000; yourself.
	p := primes2000 last + 2.
	[p <= n]
		whileTrue:
			[primes detect: [:one | p \\ one = 0] ifNone: [primes add: p].
			p := p + 2].
	primes := primes asArray
! !
