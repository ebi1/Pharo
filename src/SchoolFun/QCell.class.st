"
was former SBEcell!
"
Class {
	#name : #QCell,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction'
	],
	#category : #SchoolFun
}

{ #category : #initialization }
QCell >> initialize [
	super initialize.
	self label:''.
	self borderWidth:2.
	bounds := 0@0 corner: 16@16.
	offColor := Color paleYellow.
	onColor := Color paleBlue darker.
	self useSquareCorners.
	self turnOff
	
	
]

{ #category : #accessing }
QCell >> mouseAction: aBlock [
	^ mouseAction := aBlock
]

{ #category : #accessing }
QCell >> mouseUp: anEvent [
mouseAction value
]
