d3.select('body')
	.append('div')
	.attr('class','input')
d3.select('body')
	.append('div')
	.attr('class','windinput')
gravInput = d3.select('.input')
			.append('svg')
			.attr('height',200)
			.attr('width', 200)
			.attr('x', 10)
			.attr('y', 510)
			.attr('id','gravInput')
windInput = d3.select('.windinput')
				.append('svg')
				.attr('height',200)
				.attr('width', 200)
				.style('position','absolute')
				.attr('x',220)
				.attr('y',510)
				.attr('id','windInput')
			
windInp = new VectorInputer(windInput)
windInp.setScaleX([-0.03,0.03])
windInp.setScaleY([-0.03,0.03])
windInp.drawLabel("wind")
gravInp = new VectorInputer(gravInput)
gravInp.setScaleX([-0.03,0.03])
gravInp.setScaleY([-0.03,0.03])
gravInp.drawLabel("gravity")




w = 1000
h = 500


console.log "hello"
gravity = new Vector(0,-0.03)

wind = new Vector(0.01,0)


its = 0
mov = []
svg = d3.select("body")
		.append("svg")
		.attr("width", w)
		.attr("height", h)
		.attr('id','main')
graphSvg = d3.select("body")
			 .append("svg")
			 .style("position","absolute")
			 .style("top","8px")
			 .style("left","1010px")
			 .attr("width",200)
			 .attr('height', 200)
vectorSvg = d3.select("body")
			 .append("svg")
			 .style("position","absolute")
			 .style("top","216px")
			 .style("left","1010px")
			 .attr("width",200)
			 .attr('height', 200)
grapher = new Grapher(graphSvg)
g2 = new Grapher(vectorSvg)

svg.append('rect')
	.attr('x',0)
	.attr('y',0)
	.attr("width", w)
	.attr('height', h)
	.attr('fill','none')
	.attr('stroke','black')
	.attr('stroke-width','2px')
		

update = (m) ->
	gravity = gravInp.getMostRecentPointAsVector()
	wind = windInp.getMostRecentPointAsVector()
	m.resetForce()
	m.applyForce(gravity)
	m.applyForce(wind)
	m.update()
	m.display()
	m.checkEdges(w,h)
	
	its++
id = setInterval( ()->
	update m for m in mov
, 10)

$('#main').click( (e) ->
	if mov.length == 0
	 	mov[mov.length] = new Mover(svg, e.pageX, e.pageY, grapher, g2)
	 else
	 	mov[mov.length] = new Mover(svg, e.pageX, e.pageY, null, null		)
)
	
