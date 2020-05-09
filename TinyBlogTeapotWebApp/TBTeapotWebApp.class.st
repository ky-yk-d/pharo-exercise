Class {
	#name : #TBTeapotWebApp,
	#superclass : #Object,
	#instVars : [
		'teapot'
	],
	#classVars : [
		'Server'
	],
	#category : #TinyBlogTeapotWebApp
}

{ #category : #'starting/stopping' }
TBTeapotWebApp class >> start [ 
	Server ifNil:  [ Server := self new start ]
]

{ #category : #'starting/stopping' }
TBTeapotWebApp class >> stop [
	Server ifNotNil:  [ Server stop. Server := nil ]
]

{ #category : #initialization }
TBTeapotWebApp >> allPosts [
	^ TBBlog current allVisibleBlogPosts .
]

{ #category : #initialization }
TBTeapotWebApp >> errorPage [
	^ String streamContents: [ :s |
		self renderPageHeaderOn: s.
		s << '<p>Oups, an error occurred</p>'.
		self renderPageFooterOn: s.
		 ]
]

{ #category : #initialization }
TBTeapotWebApp >> homePage [
	^ String streamContents: [ :s |
		self renderPageHeaderOn: s.
		s << '<h1>TinyBlog Web App</h1>'.
		s << '<ul>'.
		self allPosts withIndexDo: [ :aPost :index | 
			s << '<li>';
			 << ('<a href="/post/', index asString, '">');
			 << aPost title;
			 <<'</a></li>' ].
		s << '</ul>'.
		self renderPageFooterOn: s.
		 ]
]

{ #category : #initialization }
TBTeapotWebApp >> initialize [ 
	super initialize.
	teapot := Teapot configure: { 
		#port -> 8081.
		#debugMode -> true
		}.
]

{ #category : #initialization }
TBTeapotWebApp >> pageForPostNumber: aPostNumber [
	| currentPost |
	currentPost := self allPosts at: aPostNumber ifAbsent: [ ^ self errorPage ].
	^ String streamContents: [ :s | 
		self renderPageHeaderOn: s.
		s << ('<h1>', currentPost title, '</h1>').
		s << ('<h3>', currentPost date mmddyyyy, '</h3>').
		s << ('<p> Category: ', currentPost category, '</p>').
		s << ('<p>', currentPost text, '</p>').
		self renderPageFooterOn: s ]
]

{ #category : #rendering }
TBTeapotWebApp >> renderPageFooterOn: aStream [
	aStream << '</body></html>'
]

{ #category : #rendering }
TBTeapotWebApp >> renderPageHeaderOn: aStream [
	aStream << '<html><body>'
]

{ #category : #initialization }
TBTeapotWebApp >> start [ 
	teapot
		GET: '/' -> [ self homePage ];
		GET: '/post/<id>' -> [ :request | self pageForPostNumber: (request at: #id) asNumber ];
		start.
]

{ #category : #initialization }
TBTeapotWebApp >> stop [ 
	teapot stop.
]
