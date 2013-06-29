competitors = [
	"Walker Melton"
	"Hayward Melton"
	"Bruce Melton"
	"Buckminster"
	]
	
gold = silver = bronze = rest = "unknown"

assignWinners = (first, second, third, others...) ->
	gold = first
	silver = second
	bronze = third
	rest = others
	
assignWinners competitors...

console.log "Gold: " + gold
console.log "Silver: " + silver
console.log "Bronze: " + silver

console.log competitor for competitor in rest
