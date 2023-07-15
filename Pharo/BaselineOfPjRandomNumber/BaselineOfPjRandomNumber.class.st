Class {
	#name : #BaselineOfPjRandomNumber,
	#superclass : #BaselineOf,
	#category : #BaselineOfPjRandomNumber
}

{ #category : #baselines }
BaselineOfPjRandomNumber >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec baseline: 'PharoJS' with: [ spec repository: 'github://PharoJS/PharoJS' ].
		spec package: 'PjRandomNumber' with: [ spec requires: #('PharoJS') ]
	]
]
