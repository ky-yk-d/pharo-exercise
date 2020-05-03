Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyBlog
}

{ #category : #initialization }
TBBlog class >> current [ 
	"answer the instance of the TBRepository"
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
TBBlog class >> initialize [
	self reset
]

{ #category : #initialization }
TBBlog class >> reset [ 
	uniqueInstance := nil
]

{ #category : #action }
TBBlog >> allBlogPosts [
	^ posts.
]

{ #category : #action }
TBBlog >> allBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #action }
TBBlog >> allCategories [
	^ (self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #action }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ].
]

{ #category : #action }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ]].
]

{ #category : #initialization }
TBBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new.
]

{ #category : #operations }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new.
]

{ #category : #operations }
TBBlog >> size [
	^ posts size.
]

{ #category : #operations }
TBBlog >> writeBlogPost: aTBPost [ 
	"Write the blog post in database"
	posts add: aTBPost.
]
