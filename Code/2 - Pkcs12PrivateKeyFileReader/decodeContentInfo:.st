
!Pkcs12PrivateKeyFileReader methodsFor: 'initialize-release' stamp: 'rww 4/13/2007 22:10'!
decodeContentInfo: contentInfo

	| safeContents |
	contentInfo contentType oid = '1.2.840.113549.1.7.1'
		ifTrue: [
			safeContents := ASN1Stream 
				decodeBytes: contentInfo content
				withType: ((ASN1Module name: #pkcs) find: #SafeContents).
			safeContents do: [:eachSafeBag | self decodeSafeBag: eachSafeBag].
			^ self].
	contentInfo contentType oid = '1.2.840.113549.1.7.6'
		ifTrue: [
			safeContents := contentInfo content decryptWithPassword: self password.
			safeContents do: [:eachSafeBag | self decodeSafeBag: eachSafeBag].
			^ self].
	self error: 'unknown content info: ', contentInfo contentType oid.
! !
