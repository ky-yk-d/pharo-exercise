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
SandboxTest >> testCollections [
	| heroines |
	self assert: ((Set withAll: #(7 7 3 13)) includesAll: #(7 3 13)).
	self assert: (Set withAll: #(1 1 3 6)) equals: (Set with: 1 with: 3 with: 6).
	self assert: (OrderedCollection new: 5 withAll: 'a') equals: (OrderedCollection withAll: #('a' 'a' 'a' 'a' 'a' )).
	self assert: (#('Calvin' 'hates' 'Suzan') at: 2) equals: 'hates'. "インデックスは1-origin"
	self assert: ((#('Calvin' 'hates' 'Suzie') at: 2 put: 'loves'; yourself) at: 2) equals: 'loves'.
	self assert: (#('Calvin' 'hates' 'Suzie')  asOrderedCollection addFirst: 'Recently'; at: 2) equals: 'Calvin'.
	heroines := { #Kanon -> 'Ayu'. #Air -> 'Misuzu'. #CLANNAD -> 'Nagisa' } asDictionary.
	self assert:  (heroines at: #Air) equals: 'Misuzu'.
	
]

{ #category : #tests }
SandboxTest >> testIterators [
	self assert: (#(14  -12 7 -11) collect: [ :i | i odd ]) equals: #(false false true true). "JavaのStream#mapに相当"
	self assert: (#(12 -4 2 -3) select: [ :i | i abs > 3 ]) equals: #(12 -4). "JavaのStream#filterに相当"
	self assert: (#(3 8 4 10 11) detect: [ :i | i > 9 ]) equals: 10. "JavaのStream#findFirstに相当"
	self assert: (#(3 5 9 12 7) includes: 9).  
	self assert: (#(3 5 6) select: #odd) equals: #(3 5). "Unary Messageはブロックの代わりにシンボルを渡すこともできる"
	self assert: (#(3 4 5) anySatisfy: #even).
	self assert: (#('a' 'b' 'c' 'd') pairsCollect: [ :i :j | i , j ]) equals: #('ab' 'cd').  "2つずつ要素を組として扱う"
	self assert: (#(1 2 3) with: #(10 20 30) collect: [ :x :y | x * y ]) equals: #(10 40 90). 
	self assert: 
	(String streamContents: [ :s | 
		#('a' 'b' 'c')
			do: [ :each | s << each ]
			separatedBy: [ s << ',' ]
		]) equals: 'a,b,c'.
	self assert: ((#(1 2 3 4 5 6 7) groupedBy: #even) at: false) equals: #(1 3 5 7). 
	self assert: (#(#(1 2) #(3) #(4) #(5 6)) flatCollect: [ :each | each ]) equals: #(1 2 3 4 5 6). "Stream#flatMap"
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
SandboxTest >> testStream [
	| stream |
	stream := #($a $b $c $d $e $f) readStream.
	self assert: stream next equals: $a.
	self assert: (stream upTo: $d) equals: #($b $c).
	stream := (Array new: 6) writeStream .
	self assert: ((stream nextPut: 1; yourself) contents) equals: #(1).
	self assert: stream position equals: 1.
	self assert: ((stream nextPutAll: #(4 6);yourself) contents) equals: #(1 4 6).
]

{ #category : #tests }
SandboxTest >> testYourself [
	| set |
	self assert: (Set new add: 2) equals: 2.
	set := (Set new add: 3; yourself).
	self assert: ((set add: 2; yourself) includes: 3)
]
