d3.select('body')
	.append('div')
	.attr('class','input')
inp = new Inputer('div')

gravy = inp.createTextField("gravy","")
gravb = inp.getNewButton().attr('value','setGrav').attr('id','gravButton')

windx = inp.createTextField("windx","Wind x")
windb = inp.getNewButton().attr('value', 'setWind').attr('id','windButton')


w = 1000
h = 500


console.log "hello"
gravity = new Vector(0,-0.03)

wind = new Vector(0.01,0)
$('#gravButton').click( () ->
	val = inp.getTextField(gravy)
	val = parseFloat(val)
	
	gravity = new Vector(0, val)
)
$('#windButton').click( ()->
	val = inp.getTextField(windx)
	val = parseFloat(val)
	wind = new Vector(val, 0)
)
its = 0
mov = []
svg = d3.select("body")
		.append("svg")
		.attr("width", w)
		.attr("height", h)
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
		
text = d3.select('body').append('text').text(gravity.toString())
update = (m) ->
	m.resetForce()
	m.applyForce(gravity)
	m.applyForce(wind)
	m.update()
	m.display()
	m.checkEdges(w,h)
	text.text(gravity.toString())
	its++
id = setInterval( ()->
	update m for m in mov
, 10)

$('svg').click( (e) ->
	if mov.length == 0
	 	mov[mov.length] = new Mover(svg, e.pageX, e.pageY, grapher, g2)
	 else
	 	mov[mov.length] = new Mover(svg, e.pageX, e.pageY, null, null		)
)
	
