
!KeyHolder methodsFor: 'processes' stamp: 'RJT 5/2/2007 15:53'!
randomChangeLoop
	"This loop changes the random and reencrypts the data every 100ms"
	| pKey randomGenerator |
	self randomChangeProcess: ([
		randomGenerator := SecureRandom picker.
		[
			pKey := self key.
			self random: (randomGenerator nextBytesNonZero: 32).
			self encryptKey: pKey.
			pKey destroy.
			(Delay forMilliseconds: 100) wait.
			true.
		] whileTrue.
	] forkAt: Processor highIOPriority)! !
