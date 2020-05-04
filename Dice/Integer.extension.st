Extension { #name : #Integer }

{ #category : #'*Dice' }
Integer >> D10 [
	^ self D: 10
]

{ #category : #'*Dice' }
Integer >> D2 [
	^ self D: 2
]

{ #category : #'*Dice' }
Integer >> D20 [
	^ self D: 20
]

{ #category : #'*Dice' }
Integer >> D4 [
	^ self D: 4
]

{ #category : #'*Dice' }
Integer >> D6 [
	^ self D: 6
]

{ #category : #'*Dice' }
Integer >> D: aNumberOfFaces [
	| handle |
	handle := DiceHandle new.
	self timesRepeat: [ handle addDie: (Die faces: aNumberOfFaces) ].
	^ handle.
]
