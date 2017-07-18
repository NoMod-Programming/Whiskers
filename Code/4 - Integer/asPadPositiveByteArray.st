
!Integer methodsFor: '*cryptography-core' stamp: 'rww 10/20/2016 07:47'!
asPadPositiveByteArray

	| newByteArray byteArray |
	self negative
		ifTrue: [
			byteArray := self asByteArray.
			newByteArray := ByteArray new: (byteArray size + 1).
			newByteArray at: 1 put: 0.
			newByteArray copyReplaceFrom: 2 to: newByteArray size with: byteArray.
			^ newByteArray].
	^ self asByteArray! !
