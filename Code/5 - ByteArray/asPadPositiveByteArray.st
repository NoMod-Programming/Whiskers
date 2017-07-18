
!ByteArray methodsFor: '*cryptography-core' stamp: 'rww 10/20/2016 07:48'!
asPadPositiveByteArray

	| newByteArray |
	(((self at: 1) bitAnd: 16r80) ~= 0)
		ifTrue: [
			newByteArray := ByteArray new: (self size + 1).
			newByteArray at: 1 put: 0.
			newByteArray copyReplaceFrom: 2 to: newByteArray size with: self.
			^ newByteArray].
	^ self asByteArray
! !
