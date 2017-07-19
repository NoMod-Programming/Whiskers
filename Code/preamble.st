EventHatMorph subclass: #BackdropEventHatMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!

!BackdropEventHatMorph commentStamp: '<historical>' prior: 0!
I am a hat block for stacks triggered by Scratch keyboard events.
!

Object subclass: #BlockCipher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!

!BlockCipher commentStamp: 'rww 10/17/2016 06:26' prior: 0!
Abstract class for blockmode ciphers (those which encrypt/decrypt more than 1 byte at a time, typically 64 bits)

Cryptography is now the shared package between Squeak and Pharo

- RandomGenerator class>>#unpredictableStringsDo: changed details to be squeak/pharo compliant (see comment)
- senders/implementers of #asAsn1Bytes (removed) changed to #asAsn1DerBytes
- senders/implementers of #fromAsn1Bytes: (removed) changed to #fromAsn1DerBytes:
- X509Certificate class>>#fromFile: changed use of #fromBytes: (removed) to #fromAsn1DerBytes:
- X509CertificateDerReader>>#asCertificate  changed use of #fromBytes: (removed) to #fromAsn1DerBytes:
- all CryptoX509Test>>#certificateX  changed use of #fromBytes: (removed) to #fromAsn1DerBytes:
- moved asn1 module definitions and support accessers for RSA and DSA Keys to Cryptography
- changed DiffieHellman>>sendMessage to use SecureRandom>>#nextBits: to keep bitSize
- added CryptoHashFunctionTest tests for HMAC Specs
- added String>>#padLeftTo:with: for squeak
- fixed padding mode to set and retrieve the IV vector!

BlockCipher subclass: #BlockCipherMode
	instanceVariableNames: 'cipher vector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
DialogBoxMorph subclass: #BlockCreationDialog
	instanceVariableNames: 'isAtomic block blockColumn blockParts blockPartsBin showHideButton isAtomicButton bin showingBin'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Dialogs'!
CommandBlockMorph subclass: #BlockCreatorMorph
	instanceVariableNames: 'lastParameters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
BlockCipherMode subclass: #CBC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
BlockCipherMode subclass: #CFB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
BlockCipherMode subclass: #CTR
	instanceVariableNames: 'counter counterBits maximumCounterValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!

!CTR commentStamp: 'cmm 5/11/2006 22:33' prior: 0!
This CTR mode implementation was guided by

	Nils Ferguson, Bruce Schneier.  Pratical Cryptography.  
	Wiley, 2003.
	pp. 75-82, 111-127.

With CTR, my initialVector is partitioned into a nonce and a counter ("i" in the book).  My blockSize, 128-bits, are available to accommodate both of these "fields".  The two of them combined together form my #initialVector (IV).  The book suggests the nonce portion used as a message-number used also in sequencing messages of a secure-channel (chapter 8).  The overall requirement is that the same initialVector (i.e., counter+nonce combination) never be used twice for this key (instance).  The counter is re-set to 1 each time the nonce is set.

If you run out of counter, I signal a CryptographyError.!

ExpressionArgMorph subclass: #ColoredExpressionArgMorph
	instanceVariableNames: 'type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
BlockMorph subclass: #CommandBlockMorph
	instanceVariableNames: 'commandSpec argPermutation argMorphs titleMorph receiver selector isReporter isTimed wantsName wantsPossession numberArgFlags stopFrame '
	classVariableNames: 'CBlockBottomBarForm CBlockBottomBarWithTabsForm CBlockTopBarForms '
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
Error subclass: #CryptographyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
ExpressionArgMorph subclass: #CustomBlockLabelMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
CommandBlockMorph subclass: #CustomProcedureHolder
	instanceVariableNames: 'paramNames'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
ReporterBlockMorph subclass: #CustomReporterMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
RandomGenerator subclass: #Fortuna
	instanceVariableNames: 'key ctr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!Fortuna commentStamp: 'cmm 5/4/2006 15:28' prior: 0!
Fortuna is a cryptographically secure pseudorandom number generator specified by Niels Ferguson and Bruce Schneier in chapter 10 of "Practical Cryptography."  This generator utilizes a Rijndael (AES) cipher in CTR mode and is patent-free.!

Object subclass: #HMAC
	instanceVariableNames: 'hash key ipad epad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!

!HMAC commentStamp: '<historical>' prior: 0!
HMAC is a mechanism for message authentication using cryptographic hash functions. HMAC can be used with any iterative cryptographic hash function, e.g., MD5, SHA-1, in combination with a secret shared key.  The cryptographic strength of HMAC depends on the properties of the underlying hash function.

See RFC 2114.!

Object subclass: #HashFunction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
ScratchMedia subclass: #ImageMedia
	instanceVariableNames: 'form rotationCenter textBox jpegBytes compositeForm savedForm svgForm '
	classVariableNames: 'JPEGPlaceholderForm '
	poolDictionaries: ''
	category: 'Scratch-Objects'!
Object subclass: #Json
	instanceVariableNames: 'stream ctorMap'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!Json commentStamp: '<historical>' prior: 0!
This class reads and writes JSON format data - strings, numbers, boolean, nil, arrays and dictionaries. See http://www.crockford.com/JSON/index.html. It has been extended with syntax for invoking a prearranged list of constructors on read objects.!

Json class
	instanceVariableNames: 'escapeArray'!
Object subclass: #JsonDummyTestObject
	instanceVariableNames: 'a b c'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!
JsonSyntaxError subclass: #JsonIncompleteError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonIncompleteError commentStamp: 'tonyg 4/29/2016 11:37' prior: 0!
I signal that reading a JSON value failed because more input is required, but that the input seen so far was not incorrect. Compare to JsonInvalidError.

Be warned that reading numbers directly out of a stream can be ambiguous!!

Consider reading from '1234'. Is the result intended to be 1234, or is there missing input, and the next character will be '5', making the result (possibly) 12345?!

JsonSyntaxError subclass: #JsonInvalidError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonInvalidError commentStamp: 'tonyg 4/29/2016 11:06' prior: 0!
I signal that reading a JSON value failed because the input didn't match the (extended)JSON grammar implemented by class Json.!

Dictionary subclass: #JsonObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!
Error subclass: #JsonSyntaxError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonSyntaxError commentStamp: 'tonyg 4/29/2016 11:06' prior: 0!
Class Json signals (possibly-indirect) instances of me when reading a JSON value from an input stream fails.!

TestCase subclass: #JsonTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonTests commentStamp: '<historical>' prior: 0!
I provide a number of test cases for class Json.!

Object subclass: #KeyHolder
	instanceVariableNames: 'data random randomChangeProcess'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!KeyHolder commentStamp: 'RJT 2/9/2007 11:10' prior: 0!
A KeyHolder is a construct that holds key information safely in memory.  The key is never stored in plain text in memory.  The system encrypts the key using two different objects and therefore two different memory locations.  A random key is generated and used to encrypt the key.  That random key is changed every 100ms.  To retrieve the key send the message #key.  You must send in a byteArray.  If you are storing a key that is a string then do:

KeyHolder holdKey: 'aPassword' asByteArray.  

when asking for key you will get back aByteArray so if you are looking for a string use

aByteArray := aKeyHolder key. 
pKey := aByteArray asString.
aByteArray destroy.

When you are done with the byteArray send the message destroy to it, to keep your secret key from being written to disk.  Never leave your key in memory for very log.  Get it, use it and destroy it as quickly as possible in the same message chain.

If you no longer need this keyHolder you must send the message destroy to it to stop the process and wipe the memory clean.

Instance Variables
	data:		KeyHolderData
	random:		aByteArray
	randomChangeProcess:		aProcess 

data
	- holds onto an instance of KeyHolderData which holds your encrypted key.

random
	- the key used to encrypt your key

randomChangeProcess
	- the process that changes random
!

Object subclass: #KeyHolderData
	instanceVariableNames: 'key'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!KeyHolderData commentStamp: 'RJT 2/9/2007 11:17' prior: 0!
A KeyHolderData is used by KeyHolder see comments there.

Instance Variables
	key:		<ByteArray>

key
	- key that was encrypted by KeyHolder.  This value is changed frequently by KeyHolder.
!

HashFunction subclass: #MD5
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-MD5'!

!MD5 commentStamp: 'ul 3/7/2008 19:02' prior: 0!
This class implements the MD5 128-bit one-way hash function. It uses the MD5Plugin for better performance.!

MD5 subclass: #MD5NonPrimitive
	instanceVariableNames: ''
	classVariableNames: 'ABCDTable IndexTable ShiftTable SinTable'
	poolDictionaries: ''
	category: 'Cryptography-MD5'!

!MD5NonPrimitive commentStamp: '<historical>' prior: 0!
This class implements the MD5 128-bit one-way hash function.  It relies on
the ThirtyTwoBitRegister class supplied as part of the "Digital Signatures"
functionality included in Squeak 2.7.  As of this date (1/20/2000), the
U.S. Government has lifted many of the previous restrictions on the export
of encryption software, but you should check before exporting anything
including this code.  MD5 is commonly used for some secure Internet
protocols, including authentication in HTTP, which is why I wrote it.

Submitted by Duane Maxwell

!

MD5 subclass: #MD5WithPrimitive
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-MD5'!
Object subclass: #MillerRabin
	instanceVariableNames: 'target iterations satisfied samples minusOne k n0'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!MillerRabin commentStamp: '<historical>' prior: 0!
My instances are Miller-Rabin algorithms. Miller-Rabin is a probabilistic algorithm for primality testing.!

BlockCipherMode subclass: #OFB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
BlockCipherMode subclass: #PKCS5Or7PaddingMode
	instanceVariableNames: 'cipherMode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-Core'!
Object subclass: #PasswordSaltAndStretch
	instanceVariableNames: 'r s'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!PasswordSaltAndStretch commentStamp: 'RJT 2/9/2007 16:00' prior: 0!
A PasswordSaltAndStretch is way to increase the entropy of bad passwords.  The idea is to increase the amount of work needed for an attacker to try random passwords.  The class returns two values a hash and a salt value.  The salt value is random data used to calculate the hash.  If the hash is used as a key then store the salt value along with the encrypted data.  Then to calculate the key or verify a password use hashForPassword: aPassword s: theSalt.

So 

| result |
(result := PasswordSaltAndStretch hashForPassword: 'password') = (PasswordSaltAndStretch hashForPassword: 'password' s: result value)  

should be true.

Instance Variables
	r:		<integer>
	s:		<integer>

r
	- the number of rounds used to stretch the password

s
	- salt which is random data used to make the hash unique.  The salt should be stored with encrypted data, or with the hash because it is needed to verify the hash later.
!

Object subclass: #PrimesFinder
	instanceVariableNames: 'wheel candidate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!PrimesFinder commentStamp: '<historical>' prior: 0!
My instances search for primes of a given size. They implement a probabilistic method. For speed, they first test for divisibility by the primest up to 2000 (in a deterministic way). Next, they employ a probabilistic test (such as MillerRabin).!

Object subclass: #PrimesWheel
	instanceVariableNames: 'primes residues satisfied'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!

!PrimesWheel commentStamp: '<historical>' prior: 0!
My instances are wheels of primes. See the class comment in PrimesFinder.!

CommandBlockMorph subclass: #ProcCallBlockMorph
	instanceVariableNames: 'script'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
HatBlockMorph subclass: #ProcedureHatBlockMorph
	instanceVariableNames: 'spec parameterNames isAtomic block vars runningMouse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
Object subclass: #RandomGenerator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
RandomGenerator class
	instanceVariableNames: 'picker'!
Stream subclass: #RandomPool
	instanceVariableNames: 'key pool outputStream inputIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
RandomPool class
	instanceVariableNames: 'default'!
HashFunction subclass: #SHA1
	instanceVariableNames: 'totalA totalB totalC totalD totalE totals'
	classVariableNames: 'K1 K2 K3 K4'
	poolDictionaries: ''
	category: 'Cryptography-SHA1'!

!SHA1 commentStamp: '<historical>' prior: 0!
This class implements the Secure Hash Algorithm (SHA) described in the U.S. government's Secure Hash Standard (SHS). This standard is described in FIPS PUB 180-1, "SECURE HASH STANDARD", April 17, 1995.

The Secure Hash Algorithm is also described on p. 442 of 'Applied Cryptography: Protocols, Algorithms, and Source Code in C' by Bruce Scheier, Wiley, 1996.

See the comment in class DigitalSignatureAlgorithm for details on its use.

Implementation notes:
The secure hash standard was created with 32-bit hardware in mind. All arithmetic in the hash computation must be done modulo 2^32. This implementation uses ThirtyTwoBitRegister objects to simulate hardware registers; this implementation is about six times faster than using LargePositiveIntegers (measured on a Macintosh G3 Powerbook). Implementing a primitive to process each 64-byte buffer would probably speed up the computation by a factor of 20 or more.
!

HashFunction subclass: #SHA256
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-SHA256'!

!SHA256 commentStamp: '<historical>' prior: 0!
http://csrc.nist.gov/publications/fips/fips180-2/fips180-2withchangenotice.pdf This class represnets the implementation of SHA256 as describied above.  

Please direct questions or comments about this implementation to Ron Teitelbaum: Ron@USMedRec.com

This code was extensively coppied from SHA1 by Luciano Notarfrancesco lnotarfrancesco@yahoo.com

!

SHA256 subclass: #SHA256NonPrimitive
	instanceVariableNames: 'totalA totalB totalC totalD totalE totalF totalG totalH'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-SHA256'!
SHA256 subclass: #SHA256WithPrimitive
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-SHA256'!
SVGRenderer subclass: #SVGBalloonRenderer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGSegmentRun subclass: #SVGBezierSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGEllipseMorph subclass: #SVGCircleMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
LineSegment subclass: #SVGClosingLineSegment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
MatrixTransformMorph subclass: #SVGComponentMorph
	instanceVariableNames: 'id style cachedComposedStyle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGCompositeMorph
	instanceVariableNames: 'fills'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGEllipseMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
LineSegment subclass: #SVGFixupLineSegment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGLineSegmentRun subclass: #SVGFixupLineSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
GradientFillStyle subclass: #SVGGradientFillStyle
	instanceVariableNames: 'units spread'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGGroupMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGLineMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGSegmentRun subclass: #SVGLineSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGPathMorph
	instanceVariableNames: 'segments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGPolygonalMorph subclass: #SVGPolygonMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGPolygonalMorph
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGPolygonalMorph subclass: #SVGPolylineMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Dictionary subclass: #SVGPropertyDictionary
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGRectMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGRectangularMorph
	instanceVariableNames: 'rectangle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGMorph subclass: #SVGRenderMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!

!SVGRenderMorph commentStamp: 'EMP 7/16/2017 11:11' prior: 0!
Used for Scratch, renders an SVG without any borders or background for use as a costume!

Object subclass: #SVGRenderer
	instanceVariableNames: ''
	classVariableNames: 'DefaultRenderer'
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Object subclass: #SVGSegmentRun
	instanceVariableNames: 'segments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGTextMorph subclass: #SVGTSpanMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGTextMorph
	instanceVariableNames: 'text location'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
ScratchEvent subclass: #ScratchBackdropChangeEvent
	instanceVariableNames: 'backdropName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!

!ScratchBackdropChangeEvent commentStamp: '<historical>' prior: 0!
I represent a scratch event where a key has been pressed and needs to be broadcast across the system. I do *not* get sent across the scratch network to other connected systems!

Morph subclass: #ScratchCategorySelector
	instanceVariableNames: 'label translatedLabel categoryColor isSelected textColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ScratchEvent subclass: #ScratchClonedEvent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
Morph subclass: #ScratchFrameMorph
	instanceVariableNames: 'topPane viewerPane scriptsPane stageFrame workPane titlePane libraryPane menuPanel stageButtonsPanel readoutPane logoMorph projectTitleMorph flagButton fillScreenFlag paintingInProgress projectDirectory projectName projectInfo author loginName loginPassword watcherPositions shuffledCostumeNames justSaved viewModeButtons viewMode lastViewMode viewModeButtonsPanel toolbarPanel lastWeDoPoll workPaneWrapper stopButton '
	classVariableNames: 'AllowRemoteConnectionDialog AllowSharing DefaultNotes DefaultSprite FontDefaults Fonts FontsXO IsXO ScratchClipboard ScratchServers ScratchSkin ScratchSkinXO ShareServer ShareServerPath StartupPresentationMode SupportServer SupportServerPath TakeOverScreen UseErrorCatcher UserFontScale Version VersionDate VisibleDrives WorkpaneExtent '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchLibraryMorph
	instanceVariableNames: 'scrollPane stagePane thumbWidth itemExtent spritePane buttonPane spriteLabel topSectionHeight '
	classVariableNames: 'TitleStyle '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchPresenterMorph
	instanceVariableNames: 'frame stage stageWrapper buttons flagButton offscreenWorld mouseFocus mouseDownPoint dragOffset clickWasHandled mouseMoved lastStepTime '
	classVariableNames: 'TopStyle '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Object subclass: #ScratchProcess
	instanceVariableNames: 'stackFrame topBlock readyToYield errorFlag readyToTerminate answer atomicityList ci scriptList blockVarList '
	classVariableNames: 'BlockHighlightMSecs Times '
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
Morph subclass: #ScratchScriptEditorMorph
	instanceVariableNames: 'thumbnailMorph nameMorph pageViewerMorph rotationButtons lockButton readoutMorphs penReadout currentCategory tabPaneMorph deleteButton target topSectionHeight renderTransform viewerPane '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Object subclass: #ScratchStackFrameToPerform
	instanceVariableNames: 'parentFrame selector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
Morph subclass: #ScratchTabMorph
	instanceVariableNames: 'id label translatedLabel selected mouseOver'
	classVariableNames: 'NormalStyle SelectedStyle'
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
PasteUpMorph subclass: #ScratchTabPaneMorph
	instanceVariableNames: 'targetPane currentTab lastTabAdded barForm '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ImageMorph subclass: #ScratchThumbnailMorph
	instanceVariableNames: 'target showDirection lastUpdateMSecs lastRotationDegrees draggingDirection xreadout yreadout '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchTitlePaneMorph
	instanceVariableNames: ''
	classVariableNames: 'Style'
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchViewerMorph
	instanceVariableNames: 'target pageViewer currentCategory catButtonsExtent categoryButtons topSectionHeight '
	classVariableNames: 'CatList '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!

!ScratchViewerMorph commentStamp: 'EMP 7/13/2017 15:27' prior: 0!
I am a Scratch blocks palette viewer. I have a set of ScratchCategorySelectors that allow selection of a blocks category to view and a scrollable area showing the blocks in the currently selected category.
The actual palette of blocks is a ScratchBlockPaletteMorph inside me, just to cause confusion. So to test if a morph is the tile palette we actually have to do nasty things like 
((self ownerThatIsA: ScratchViewerMorph) notNil) ifTrue: [
so watch out for that.
!

Morph subclass: #ScratchWorkpaneMorph
	instanceVariableNames: 'workPane titlePane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!

!ScratchWorkpaneMorph commentStamp: 'EMP 7/14/2017 10:10' prior: 0!
I hold the workPane and titlePane for the ScratchFrameMorph, to prevent it from having to draw everything, or having to compute bounds multiple times while drawing.!

BorderedMorph subclass: #ScrollFrameMorph
	instanceVariableNames: 'contents hScrollbar vScrollbar cornerMorph hbarInset vbarInset contentsChanged growthFraction transform localBounds smoothing '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
RandomGenerator subclass: #SecureRandom
	instanceVariableNames: 'seed key'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
Object subclass: #SmalltalkImageInstanceID
	instanceVariableNames: ''
	classVariableNames: 'InstanceID'
	poolDictionaries: ''
	category: 'Cryptography-RandomAndPrime'!
ArgMorph subclass: #SpriteArgMorph
	instanceVariableNames: 'menuIconMorph morph type '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
EventHatMorph subclass: #WhenClonedEventHatMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!

!WhenClonedEventHatMorph commentStamp: '<historical>' prior: 0!
I am a hat block for stacks triggered by clicking on an object with the mouse.
!

HatBlockMorph subclass: #WhenGreaterThanHatBlockMorph
	instanceVariableNames: 'argMorph argMorph2 lastState lastArg secondArgMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
