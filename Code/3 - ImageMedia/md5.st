
!ImageMedia methodsFor: 'accessing' stamp: 'EMP 11/3/2017 22:42'!
md5
	svgForm ifNotNil: [
		^ (MD5 hexHashStream: (ReadStream on: svgForm)), '.svg'
	] ifNil: [
		^ (MD5 hexHashStream: (ReadStream on: (ByteArray streamContents: [:strm |
			PNGReadWriter putForm: form onStream: strm]))), '.png'
	]! !
