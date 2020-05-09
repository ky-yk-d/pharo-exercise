Class {
	#name : #ExerciseWeek3Test,
	#superclass : #TestCase,
	#category : #Sandbox
}

{ #category : #tests }
ExerciseWeek3Test >> testChallenge1 [
	| email url |
	email := 'stephane.ducasse@inria.fr'.
	url := 'http://www.gravatar.com/avatar/' , (MD5 hashMessage: email trimBoth asLowercase ) hex , '.jpg'.
	self deny: ((ZnEasy getJpeg: url) isNil )"asMorph openInHand.".
]

{ #category : #tests }
ExerciseWeek3Test >> testComparingExpressions [
	| array result |
	array := #(2 4 4 4  5 5 7 9).
	result := array in: [ :input | ((input - input average ) squared sum / (input size -1 )) sqrt ].
	self assert: array stdev equals:  result . "標準偏差の計算"
]

{ #category : #tests }
ExerciseWeek3Test >> testExamineTheBlockExpressions [

	|  sum array |
	sum := 0.
	array := #(21 23 53 66 87).
	array do: [ :item | sum := sum + item ].
	sum. "= 250"
	self assert: (array inject: 0 into: [ :sum2 :each | sum2 + each ]) equals: sum
]
