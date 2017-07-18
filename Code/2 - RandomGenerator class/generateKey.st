
!RandomGenerator class methodsFor: 'initialize-release' stamp: 'cmm 12/16/2006 10:49'!
generateKey
	| unguessableBytes prior |
	prior := UUID new shuffled asInteger.
	unguessableBytes := ByteArray streamContents: 
		[ : stream | 
		self unpredictableStringsDo: 
			[ : each | 
			| current |
			current := each size < 30 
				ifTrue: 
					[ "Some of the inputs are pretty short, expand them a little, and take opportunity to inject some extra craziness."
					(each asByteArray asInteger
						raisedTo: 64
						modulo: 6773186437430423149	"prime") asByteArray ]
				ifFalse: [ each ].
			"make each value dependent on the prior values, so the adversary is required to get every single string exactly right AND guess every the randomizations correctly."
			current := SHA1 new hashMessage: (current bitXor: prior).
			stream nextPutAll: current asByteArray.
			prior := current ] ].
	^ SHA256 new hashMessage: unguessableBytes! !
