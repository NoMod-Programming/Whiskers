
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 4/29/2016 11:19'!
testIncomplete
	self assertIncompleteJson: ''.
	self assertIncompleteJson: '  '.
	self assertIncompleteJson: '  tr'.
	self assertIncompleteJson: 'tru'.
	self assertIncompleteJson: '['.
	self assertIncompleteJson: '[true'.
	self assertIncompleteJson: '[true,'.
	self assertIncompleteJson: '{'.
	self assertIncompleteJson: '{"hi"'.
	self assertIncompleteJson: '{"hi":'.
	self assertIncompleteJson: '{"hi":true'.
	self assertIncompleteJson: '{"hi":true,'.
	self assertIncompleteJson: '{"hi":true,"'.
	self assertIncompleteJson: '"hello'.
	self assertIncompleteJson: '"hello '.
	self assertIncompleteJson: '"hello\'.
	self assertIncompleteJson: '"\u26'.! !
