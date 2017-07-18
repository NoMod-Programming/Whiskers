
!DES methodsFor: 'accessing' stamp: 'hmm 10/2/2006 22:21'!
encryptBlock: aByteArray
	| int |
	self primPluginAvailable
		ifTrue: [
			encrypting = true ifFalse: [self key: key encrypt: true].
			^self transform: aByteArray].
	nonPrimitive isNil ifTrue: [
		nonPrimitive := DESNonPrimitive new setKeyFromByteArray: key]. 
	int := ((aByteArray unsignedLongAt: 1 bigEndian: true) bitShift: 32)
			+ (aByteArray unsignedLongAt: 5 bigEndian: true).
	int := nonPrimitive encryptBlock: int.
	aByteArray unsignedLongAt: 1 put: (int bitShift: -32) bigEndian: true.
	aByteArray unsignedLongAt: 5 put: (int bitAnd: 16rFFFFFFFF) bigEndian: true! !
