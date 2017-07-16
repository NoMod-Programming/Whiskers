# NuWhiskers
The version of Whiskers (https://scratch.mit.edu/discuss/topic/157672/) based off of NuScratch.

# Using this source
This source was created by the `ScratchFrameMorph class>>fileOutChanges` method. If you want to create a Whiskers image from this source, first download a new Squeak 5.0 image and load [NuScratch](http://www.squeaksource.com/NuScratch.html) on it. Then, file in the `contentsAsStream` method from `3 - ZipArchiveMember` and the `fileInChangesFromDirectory` method from `3 - ScratchFrameMorph class`. Then, in a new workspace, run `ScratchFrameMorph fileInChangesFromDirectory: (FileDirectory default directoryNamed: 'Code')`
