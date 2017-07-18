
!SmalltalkImageInstanceID class methodsFor: 'inquires' stamp: 'RJT 8/23/2006 00:38'!
instanceID
	
	^InstanceID ifNil: [
		Transcript show: thisContext sender.
		thisContext sender receiver = self ifTrue: [
			InstanceID := UUID new.
		] ifFalse: [
			InstanceID := nil
		].
		InstanceID].! !
