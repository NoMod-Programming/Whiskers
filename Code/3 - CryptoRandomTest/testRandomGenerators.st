

!CryptoRandomTest methodsFor: 'others' stamp: 'cmm 1/10/2007 21:37'!

testRandomGenerators

	| random randomBytes |

	RandomGenerator allSubclassesDo: 

		[ : each | 

		random := each withGeneratedKey.

		100 timesRepeat: 

			[ self assert: ((random nextBits: 1) between: 0 and: 1) ].

		100 timesRepeat: [ self assert: (random nextBits: 1024) highBit <= 1024 ].

		"Random enough to span all 10 within 100-elements?"

		self assert: ((1 to: 100) collect: [ : n | random nextInt: 10 ]) asSet asSortedCollection = (1 to: 10) asSortedCollection.

		randomBytes := random nextBytes: 100.

		self

			assert: randomBytes size = 100 ;

			assert: randomBytes asSet size > 1	"if this fails, I wanna see it!!" ]! !

