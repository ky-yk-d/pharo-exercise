Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #MyCounterTest
}

{ #category : #tests }
CounterTest >> testCounterIsSetAndRead [
	| c |
	c := Counter new.
	c count: 7.
	self assert: c count equals: 7.
	
]

{ #category : #tests }
CounterTest >> testDecrement [

	| c |
	c := Counter new.
	c count: 2.
	c decrement ; decrement.
	self assert: c count = 0
]

{ #category : #tests }
CounterTest >> testIncrement [

	| c |
	c := Counter new.
	c count: 0.
	c increment ; increment.
	self assert: c count = 2
]

{ #category : #tests }
CounterTest >> testValueAtCreationTimeIsZero [

	self assert: Counter new count = 0
]
