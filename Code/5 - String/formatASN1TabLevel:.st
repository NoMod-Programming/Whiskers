
!String methodsFor: '*cryptography-asn1' stamp: 'RJT 9/1/2006 15:38'!
formatASN1TabLevel: aTabLevel
	| aReadStream aWriteStream | 
	"return a asn1 tab formed string
	'30818513818154686973206973206120313239206279746520737472696E672C2062757420746861742069732061207265616C6C79206C6F6E6720737472696E6720736F204920686176652061206C6F7420746F20747970652E20204E6F7065204920616D206E6F7420646F6E65207965742C207374696C6C206E6F7420646F6E6520616C6D6F' formatASN1
	"
	aReadStream := ((self copyWithoutAll: {Character space. Character tab. Character cr}) divideBySize: 2) readStream.
	aWriteStream := String new writeStream.
	aWriteStream nextPutAll: (aReadStream formatASN1TabLevel: aTabLevel).
	^aWriteStream contents! !
