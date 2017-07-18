
!ByteArray methodsFor: '*cryptography-core' stamp: 'rww 10/27/2016 08:05'!
padToMultipleOf: blockSize
	"Answer a new ByteArray that is padded to anInteger bytes.  This is used by block-based ciphers where the length of the ByteArray to be encrypted must be a multiple of that ciphers #blockSize.  The padding scheme used here is option #2 as specified by Ferguson and Schneier in 'Practical Cryptography', p. 68-69."
	| answer pad |
	answer := ByteArray new: (self paddedSize: blockSize).
	answer
		replaceFrom: 1
		to: self size
		with: self
		startingAt: 1.
	pad := answer size - self size.
	answer
		replaceFrom: (self size+1)
		to: answer size
		with: (ByteArray new: pad withAll: pad)
		startingAt: 1.
	^ answer! !
