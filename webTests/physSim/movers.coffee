class Mover
	constructor: (@svg, @x, @y, @g, @g2) -> 
		@circ = @svg.append('circle')
						.attr('cx', @x)
						.attr('cy', @y)
						.attr('r', 20)
						.attr("fill","red")
		@points = []
		@force = new Vector(0.0,0.0)
		@vel = new Vector(0.0,0.0)
		
	display: () ->
			@points.push(@svg.append('circle')
				.attr('r',1)
				.attr('cx', @x)
				.attr('cy',@y)
				.attr('fill','orange'))
			@circ.attr("cx", @x)
				.attr("cy", @y)
			
			if(@points.length > 600)	
				@points[0].remove()
				@points.shift()
	applyForce: (v) ->
		@force = @force.add(new Vector(v.x, v.y*-1))
	resetForce: () ->
		@force = new Vector(0.0,0.0)
	update: () ->
		@vel = @vel.add(@force)
		@x += @vel.x
		@y += @vel.y
		nv = @vel.mult(20)
		nv = new Vector(nv.x, nv.y*-1)
		@g.drawSingleBar(nv.mag())
		@g2.drawVector(nv)
		
	
	checkEdges: (w, h) ->
		if(@x+10 >= w)
			@x = w-10
			@vel.x*=-1
		else if(@x-10 <= 0)
			@x = 10
			@vel.x*=-1
		if(@y+10 >= h)
			@vel.y*=-1
			@y = h-10
		if(@y-10 <= 0)
			@y = 10
			@vel.y*=-1
this.Mover = Mover
		