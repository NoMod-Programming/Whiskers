
!ScratchStageMorph class methodsFor: 'block specs' stamp: 'EMP 7/16/2017 19:26'!
blockSpecs

	| blocks |
	blocks _ #(
			'Control'
			('wait %n secs'					t	wait:elapsed:from: 1)
			-
			('forever'						c	doForever)
			('repeat %n'						c	doRepeat 10)
			-
			('if %b'							c	doIf)
			('if %b'							c	doIfElse)
			('wait until %b'					s	doWaitUntil)
			('repeat until %b'				c	doUntil)
			('while %b'						c	doWhile)
			('all at once'					c	warpSpeed)
			-
			('stop %m.stop'	s	stopScripts 'all')
			-
			('create clone of %m.spriteOnly'			-	createCloneOf)
		'Sensing'
			('ask %s and wait'			s	doAsk 'What''s your name?')
			('answer'					r	answer)
			-
			('mouse x'					r	mouseX)
			('mouse y'					r	mouseY)
			('mouse down?'				b	mousePressed)
			-
			('key %m.key pressed?'			b	keyPressed: 'space')
			-
			('timer'						r	timer)
			('reset timer'				-	timerReset)
			-
			('%m.attribute of %m.spriteOrStage'					r	getAttribute:of:)
			-
			('loudness'					r	soundLevel)
			('loud?'						b	isLoud)
		'Looks'
			('switch backdrop to %m.backdrop'	-	showBackground: 'background1')
			('switch backdrop to %m.backdrop and wait' s startSceneAndWait 'background1')
			('next backdrop'				-	nextBackground)
			('backdrop name'			r	backdropName)
			('backdrop #'				r	backgroundIndex)
			-
			('change %m.effect effect by %n'	-	changeGraphicEffect:by: 'color' 25)
			('set %m.effect effect to %n'		-	setGraphicEffect:to: 'color' 0)
			('clear graphic effects'		-	filterReset)
		'Pen'
			('clear'						-	clearPenTrails)
	).
	^ blocks, super blockSpecs! !
