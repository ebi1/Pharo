Class {
	#name : #QGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cellsPerSide',
		'cells'
	],
	#category : #SchoolFun
}

{ #category : #'parts bin' }
QGame class >> descriptionForPartsBin [
	^self partName: 'QGame'
	 categories:	#('Quinto')
      documentation:'SQE-Beispiel von df1te' 
]

{ #category : #'as yet unclassified' }
QGame >> cellsPerSide [
	"the number of cells along each side"
	^ 10
]

{ #category : #initialization }
QGame >> initialize [
	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide.
	sampleCell := QCell new.
	width := sampleCell width.
	height := sampleCell height.
	self bounds: (5@5 extent: ((width*n) @(height*n)) + (2 * self borderWidth)).
	"Array2D war in Squeak Matrix !!"
	cells := Array2D  new: n tabulate: [ :i :j | self newCellAt: i at: j ].

]

{ #category : #'as yet unclassified' }
QGame >> newCellAt: i at: j [
	" Create ..."
	| c origin |
	c := QCell new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i -1)*c width) @ ((j -1)* c height) + origin.
	c mouseAction: [self toggleNeighboursOfCellAt: i at: j].
	^ c
]

{ #category : #'game logic' }
QGame >> toggleNeighboursOfCellAt: i at: j [
	(i >1) ifTrue: [ (cells at: i - 1 at: j )toggleState].
	(i < self cellsPerSide) ifTrue: [ (cells at: i + 1 at: j )toggleState].
	(j >1) ifTrue:[ (cells at: i  at: j-1 )toggleState].
	(j < self cellsPerSide) ifTrue: [ (cells at: i  at: j +1)toggleState].
]
