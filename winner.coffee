#!/usr/bin/env coffee

print = (val) -> console.log val + "\n"

toActOn = [
	"Walker"
	"Hayward"
	"Bruce"
	"Juli"
	"Buckminster"
]

funct = (act1...) ->
	print item for item in act1
	addToFinalString item for item in act1
	print finalString
	
finalString = ""

addToFinalString = (item) -> finalString = finalString + " "  + item

funct toActOn