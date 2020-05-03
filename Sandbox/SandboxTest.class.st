Class {
	#name : #SandboxTest,
	#superclass : #TestCase,
	#category : #Sandbox
}

{ #category : #tests }
SandboxTest >> testBlocks [
	| block block2|
	block := [ :x :y | x + y ].
	self assert: (block value: 2 value:3) equals: 5.
	block2 := [ :x :y | ^ (x + y) ].
	self assert: (block value:2 value:3) equals: 5
]

{ #category : #tests }
SandboxTest >> testBooleans [
	| num |
	num := true
		ifTrue: [ 2 ]
		ifFalse: [ 3 ].
	self assert: num equals: 2.
	#(1 3 5)
		ifEmpty: [ Transcript show: 'Empty List passed!' ]
		ifNotEmpty: [ :aList | Transcript show: (aList at: 2) ].
]

{ #category : #tests }
SandboxTest >> testLoops [
	| num |
	1 to: 100 do: [ :i | Transcript show: i ; space ]. "1 2 3 4 5 .... 99 100"
	1 to: 100 by: 3 do: [ :i | Transcript show: i ; space ]. "1 4 7 10 ... 97 100"
	#(15 10 19 68) do: [ :i | Transcript show: i ; cr  ].
	num := 1.
	[ num < 5 ] whileTrue: [ Transcript show: num. num := num + 1]. "1234"
	[ Transcript show: num. num := num + 1. num < 10] whileTrue.
]

{ #category : #tests }
SandboxTest >> testPrecedence [
	| temp |
	self assert: 1000 factorial class name equals: 'LargePositiveInteger'. "left to right"
	self assert: (2 raisedTo: 3 + 2) equals: 32.  "binary -> keyword"
	self assert: Color gray - Color white equals: Color black.
	temp := 1 class maxVal + 1.
	self assert: 1 class name equals: 'SmallInteger'.
	self assert: temp class name equals: 'LargePositiveInteger'.
	"四角形"
	self assert: (0@0 extent: 100@200) bottomLeft equals: 0@200. "レシーバーが左上の四角形、xが左右、yが上下"
	"四則演算の規則にはしたがっていない"
	self assert: 3 + 2 * 10 equals: 50. "通常の演算規則とは異なり、先に3+2が計算される（左が先）"
	self assert: 3 + (2 * 10) equals: 23. "括弧をつければよい"
]

{ #category : #tests }
SandboxTest >> testSequenceAndCascade [
	self assert: (OrderedCollection new add: 1) class name equals: 'SmallInteger'. "addは新しく追加した要素を返す"
	self assert: (OrderedCollection new 
		add: 1;
		add: 2;
		yourself) class name
		equals: 'OrderedCollection'.
	
]

{ #category : #tests }
SandboxTest >> testYourself [
	| set |
	self assert: (Set new add: 2) equals: 2.
	set := (Set new add: 3; yourself).
	self assert: ((set add: 2; yourself) includes: 3)
]
