Class {
	#name : #SandboxTest,
	#superclass : #TestCase,
	#category : #Sandbox
}

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
