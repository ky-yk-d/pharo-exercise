Class {
	#name : #DiceHandleTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DiceHandleTest >> testAdding [
	| h |
	h := DiceHandle new
		addDie: (Die faces: 6);
		addDie: (Die faces: 10); yourself .
	self assert: h diceNumber equals: 2.
]

{ #category : #tests }
DiceHandleTest >> testAddingTwiceTheSameDieIsOK [
	| h |
	h := DiceHandle new
		addDie: (Die faces: 6);
		addDie: (Die faces: 6); yourself .
	self assert: h diceNumber equals: 2.
]

{ #category : #tests }
DiceHandleTest >> testMaxValue [
	| h |
	h := DiceHandle new
		addDie: (Die faces: 6);
		addDie: (Die faces: 10); yourself .
	self assert: h maxValue equals: 16.
]

{ #category : #tests }
DiceHandleTest >> testRoling [ 
	| h |
	h := DiceHandle new
		addDie: (Die faces: 6);
		addDie: (Die faces: 10); yourself .
	1000 timesRepeat: [ self assert: (h roll between: 1 and: h maxValue) ]
]
