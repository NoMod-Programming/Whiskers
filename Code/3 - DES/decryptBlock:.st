
!DES methodsFor: 'accessing' stamp: 'hmm 10/2/2006 22:42'!
decryptBlock: aByteArray
	| int |
	self primPluginAvailable
		ifTrue: [
			encrypting = false ifFalse: [self key: key encrypt: false].
			^self transform: aByteArray].
	nonPrimitive isNil ifTrue: [
		nonPrimitive := DESNonPrimitive new setKeyFromByteArray: key]. 
	int := ((aByteArray unsignedLongAt: 1 bigEndian: true) bitShift: 32)
			+ (aByteArray unsignedLongAt: 5 bigEndian: true).
	int := nonPrimitive decryptBlock: int.
	aByteArray unsignedLongAt: 1 put: (int bitShift: -32) bigEndian: true.
	aByteArray unsignedLongAt: 5 put: (int bitAnd: 16rFFFFFFFF) bigEndian: true! !
