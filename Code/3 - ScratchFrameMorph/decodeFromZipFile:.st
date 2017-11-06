
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 11/3/2017 21:52'!
decodeFromZipFile: aFileName
	| archive images json jsonText stage sounds |
	images := Dictionary new.
	sounds := Dictionary new.
	archive := ZipArchive new.
	archive readFrom: aFileName.
	archive members
		do: [:member | | memberName | 
			memberName := member fileName.
			(memberName endsWith: '.gif')
					| (memberName endsWith: '.jpg')
					| (memberName endsWith: '.png')
				ifTrue: [images
						at: (MD5 hexHashStream: member contentStream)
						put: (Form fromBinaryStream: member contentStream)].
			(memberName endsWith: '.svg')
				ifTrue: [images
						at: (MD5 hexHashStream: member contentStream)
						put: (XMLDOMParser parseDocumentFrom: member contentsAsStream)].
			(memberName endsWith: '.wav')
					| (memberName endsWith: '.mp3')
				ifTrue: [sounds
						at: (MD5 hexHashStream: member contentStream)
						put: (SampledSound fromStream: member contentStream)].
			(memberName endsWith: '.json')
				ifTrue: [jsonText := (member contentStreamFromEncoding: 'utf-8') text]].
	jsonText
		ifNil: [^ nil].
	(json := Json readFrom: jsonText)
		ifError: [^ nil].
	json isDictionary
		ifFalse: [^ nil].
	json children
		ifNotNil: [stage := ScratchStageMorph new.
			stage
				readJSON: json
				images: images
				sounds: sounds].
	^ stage! !
