

!X509CertificateExtension methodsFor: 'accessing' stamp: 'rww 3/28/2007 14:22'!

extnValue: anObject

	"Set the value of extnValue"



	extnValue := anObject.

	self decodeExtension.! !

