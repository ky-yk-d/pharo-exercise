"
I'm simple die
"
Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #initialization }
Die >> initialize [ 

	super initialize .
	faces := 6.
]

{ #category : #operations }
Die >> roll [

	^ faces atRandom .
]
