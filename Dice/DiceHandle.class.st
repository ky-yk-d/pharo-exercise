Class {
	#name : #DiceHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #adding }
DiceHandle >> addDie: aDie [ 
	dice add: aDie.
]

{ #category : #accessing }
DiceHandle >> diceNumber [
	^ dice size
]

{ #category : #initialization }
DiceHandle >> initialize [

	super initialize.
	dice := OrderedCollection new.
]
