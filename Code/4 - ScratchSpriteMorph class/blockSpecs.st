
!ScratchSpriteMorph class methodsFor: 'block specs' stamp: 'EMP 7/16/2017 21:24'!
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
			-
			"('stop script'					s	doReturn)
			('stop all'						-	stopAll)"
			('stop %m.stop'	s	stopScripts 'all')
			-
			('when I start as a clone'		C	-)
			('create clone of %m.spriteOnly'			-	createCloneOf)
			('delete clone'					-	deleteClone)
			-
		'Motion'
			('move %n steps'				-	forward:)
			('turn @turnRight %n degrees'				-	turnRight: 15)	"icon shows turn direction"
			('turn @turnLeft %n degrees'				-	turnLeft: 15)	"icon shows turn direction"
			-
			('point in direction %d.direction'			-	heading: 90)
			('point towards %m.spriteOrMouse'				-	pointTowards:	mouse)
			-
			('go to x:%n y:%n'				-	gotoX:y: 0 0)
			('go to %m.location'						-	gotoSpriteOrMouse: mouse)
			('glide %n secs to x:%n y:%n'	t	glideSecs:toX:y:elapsed:from: 1 50 50)
			-
			('change x by %n'				-	changeXposBy: 10)
			('set x to %n'					-	xpos: 0)
			('change y by %n'				-	changeYposBy: 10)
			('set y to %n'					-	ypos: 0)
			-
			('if on edge, bounce'			-	bounceOffEdge)
			-
			('set rotation style %m.rotationStyle'			-	setRotationStyle)
			-
			('x position'						r	xpos)
			('y position'						r	ypos)
			('direction'						r	heading)
		'Pen'
			('clear'							-	clearPenTrails)
			-
			('stamp'							-	stampCostume)
			-
			('pen down'						-	putPenDown)
			('pen up'						-	putPenUp)
			-
			('set pen color to %c'			-	penColor:)
			('change pen color by %n'		-	changePenHueBy:)
			('set pen color to %n'			-	setPenHueTo: 0)
			-
			('change pen shade by %n'		-	changePenShadeBy:)
			('set pen shade to %n'			-	setPenShadeTo: 50)
			-
			('change pen size by %n'		-	changePenSizeBy: 1)
			('set pen size to %n'				-	penSize: 1)
	).
	blocks _ blocks, #(
		'Looks'
			('say %s for %n secs'			t	say:duration:elapsed:from: 'Hello!!!!' 2)
			('say %s'						-	say: 'Hello!!!!')
			('think %s for %n secs'			t	think:duration:elapsed:from: 'Hmm...' 2)
			('think %s'						-	think: 'Hmm...')
			-
			('show'							-	show)
			('hide'							-	hide)
			-
			('switch to costume %m.costume'			-	lookLike:)
			('next costume'					-	nextCostume)
			('switch to backdrop %m.backdrop'		-	startScene)
			('switch backdrop to %m.backdrop and wait' s startSceneAndWait 'backdrop1')
			-
			('change %m.effect effect by %n'		-	changeGraphicEffect:by: 'color' 25)
			('set %m.effect effect to %n'			-	setGraphicEffect:to: 'color' 0)
			('clear graphic effects'			-	filterReset)
			-
			('change size by %n'			-	changeSizeBy:)
			('set size to %n %'				-	setSizeTo: 100)
			-
			('go to front'					-	comeToFront)
			('go back %n layers'			-	goBackByLayers: 1)
			-
			('costume #'						r	costumeIndex)
			('backdrop name'				r	backdropName)
			('size'							r	scale)
		'Sensing'
			('touching %m.touching ?' 				b	touching:)
			('touching color %c ?' 			b	touchingColor:)
			('color %c is touching %c ?'		b	color:sees:)
			('distance to %m.spriteOrMouse'				r	distanceTo:)
			-
			('ask %s and wait'				s	doAsk 'What''s your name?')
			('answer'						r	answer)
			-
			('key %m.key pressed?'				b	keyPressed: 'space')
			('mouse down?'					b	mousePressed)
			('mouse x'						r	mouseX)
			('mouse y'						r	mouseY)
			-
			('loudness'						r	soundLevel)
			('loud?'							b	isLoud)
			-
			('timer'							r	timer)
			('reset timer'					-	timerReset)
			-
			('%m.attribute of %m.spriteOrStage'	r	getAttribute:of:)
			-
			('current %m.timeAndDate'					r	timeAndDate)
			('days since 2000'				r	timestamp)
			('username'						r	getUserName)
		).
	^ blocks, super blockSpecs! !
