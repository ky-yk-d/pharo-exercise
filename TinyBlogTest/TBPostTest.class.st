Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#category : #TinyBlogTest
}

{ #category : #tests }
TBPostTest >> testPostCanBeChangedItsVisibility [
	| post |
	post := TBPost new.
	post beVisible.
	post notVisible.
	self deny:  post isVisible.
]

{ #category : #tests }
TBPostTest >> testPostStateWhenInitialized [
	| post |
	post := TBPost
		title: 'サンプルタイトル'
		text: 'サンプル本文'
		category: 'テスト'.
	self deny: post isVisible.
	self assert: post category equals:  'テスト'.
	self assert: post date equals:  Date today.
	self assert: post title equals: 'サンプルタイトル'.
	self assert: post text equals: 'サンプル本文'.
	
]

{ #category : #tests }
TBPostTest >> testPostStateWhenInitializedWithoutCategory [
	| post |
	post := TBPost
		title: 'サンプルタイトル'
		text: 'サンプル本文'.
	self deny: post isVisible.
	self assert: post category equals:  'Unclassified'.
	self assert: post date equals:  Date today.
	self assert: post title equals: 'サンプルタイトル'.
	self assert: post text equals: 'サンプル本文'.
	
]

{ #category : #tests }
TBPostTest >> testPostVisibility [
	| post |
	post := TBPost new.
	post beVisible.
	self assert: post isVisible.
]

{ #category : #tests }
TBPostTest >> testPostVisibilityWhenInitialized [
	| post |
	post := TBPost new.
	self deny: post isVisible.
	self assert: post category equals:  'Unclassified'.
	self assert: post date equals:  Date today.
]
