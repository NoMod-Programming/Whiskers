
!SoundMedia methodsFor: 'accessing' stamp: 'EMP 11/3/2017 22:45'!
md5
	| str |
	str := ReadStream on: ((ByteArray streamContents: [:strm |
				self sound storeWAVSamplesOn: strm])).
	^ (MD5 hexHashStream: str), '.wav'! !
