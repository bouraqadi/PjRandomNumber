Class {
	#name : #PjRandomNumberApp,
	#superclass : #PjFileBasedWebApp,
	#instVars : [
		'maxNumberInput',
		'randomNumberText',
		'maxNumber'
	],
	#category : #PjRandomNumber
}

{ #category : #actions }
PjRandomNumberApp >> generateNumber [

console log: 'generateNumber'.
	self randomNumberText textContent: (0 to: self maxNumber) atRandom
]

{ #category : #accessing }
PjRandomNumberApp >> generateNumberButton [
	^self elementAt: #generateNumberButton
]

{ #category : #initialization }
PjRandomNumberApp >> initialize [

	super initialize.
	self
		onChangeElement: self maxNumberInput
		do: [ :newMaxString | self updateMaxNumber: newMaxString ].
	self
		onClickElement: self generateNumberButton
		do: [ self generateNumber ].
	self maxNumberInput value: 6.
	self maxNumber: 6
]

{ #category : #accessing }
PjRandomNumberApp >> maxNumber [

	^ maxNumber
]

{ #category : #accessing }
PjRandomNumberApp >> maxNumber: newMax [

	maxNumber := newMax.
	self generateNumber
]

{ #category : #accessing }
PjRandomNumberApp >> maxNumberInput [

	^maxNumberInput ifNil: [maxNumberInput := self elementAt: #maxNumberInput]
]

{ #category : #accessing }
PjRandomNumberApp >> randomNumberText [

	^ randomNumberText ifNil: [ 
		  randomNumberText := self elementAt: #randomNumberText ]
]

{ #category : #actions }
PjRandomNumberApp >> updateMaxNumber: newMaxString [

	self maxNumber: newMaxString asInteger.

]
