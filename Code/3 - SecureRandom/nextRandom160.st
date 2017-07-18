
!SecureRandom methodsFor: 'private' stamp: 'len 8/4/2002 00:21'!
nextRandom160
	"Answer a newly generated 160-bit random number in the range [1..(2^160 - 1)]."
	"Details: Try again in the extremely unlikely chance that zero is encountered."

	| result |
	result := 0.
	[result = 0] whileTrue: [
		result := SHA1 new hashInteger: key seed: seed.
		key := key + result + 1].
	^ result! !
