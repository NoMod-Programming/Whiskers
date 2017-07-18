
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/17/2016 14:18'!
testStreaming
	| j |
	j := Json new stream: 'truefalsetrue[]{}1.234 5.678"A""B"nullnull' readStream.
	self assert: j readAny equals: true.
	self assert: j readAny equals: false.
	self assert: j readAny equals: true.
	self assert: j readAny equals: #().
	self assert: j readAny equals: JsonObject new.
	self assert: j readAny equals: 1.234.
	self assert: j readAny equals: 5.678.
	self assert: j readAny equals: 'A'.
	self assert: j readAny equals: 'B'.
	self assert: j readAny equals: nil.
	self assert: j readAny equals: nil.! !
