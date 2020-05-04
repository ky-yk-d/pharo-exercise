Class {
	#name : #DiceHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #operations }
DiceHandle >> + aDiceHandle [ 
	
	| handle |
	handle := self class new.
	dice do: [  :each | handle addDie: each  ].
	aDiceHandle dice do: [ :each | handle addDie: each].
	^ handle 
]

{ #category : #adding }
DiceHandle >> addDie: aDie [ 
	dice add: aDie.
]

{ #category : #accessing }
DiceHandle >> dice [
	^ dice
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

{ #category : #operations }
DiceHandle >> maxValue [

	| res |
	res := 0.
	dice do: [ :each | res := res + each faces ].
	^ res.
]

{ #category : #operations }
DiceHandle >> roll [ 
	| res |
	res := 0.
	dice do: [ :each | res := res + each roll ].
	^ res
]
