# requires movers.coffee
	# requires vector.coffee

class systemController
	constructor: (@svg) ->
		@movers = []
		@forces = []
	addForce: (v) ->
		@forces[@forces.length] = v
		return @forces.length - 1
	addMover: (x,y,g1,g2) ->
		@movers[@movers.length] = new Mover(@svg,x,y,g1,g2)
		@movers[@mover.length - 1].display()
		return @mover.length - 1
	rUpdate: (i) ->
		if(i == @movers.length) 
			return
		else
			@movers[i].resetForce()
			@movers[i].applyForce(f) for f in @forces
			@movers[i].update()
			@movers[i].display()
			rUpdate(i+1)
	update: () ->
		rUpdate(0)