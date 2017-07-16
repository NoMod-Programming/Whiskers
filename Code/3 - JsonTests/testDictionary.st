
!JsonTests methodsFor: 'as yet unclassified' stamp: 'Igor.Stasenko 12/27/2009 08:19'!
testDictionary
	self json: '{}' equals: (JsonObject new).
	self json: '{"a": "a"}' equals: (JsonObject new at: 'a' put: 'a'; yourself).
	self json: '{"a": [[]]}' equals: (JsonObject new at: 'a' put: #(#()); yourself).
	self json: '{"a":"b", "b":"a"}' equals: (JsonObject new add: 'a'->'b'; add: 'b'->'a';yourself).! !
