dataset = [5, 10, 13, 19, 23, 12, 16, 17,11]
w = 500
h = 100
barPadding = 1;
svg = d3.select("body").append("svg").attr("width", w).attr("height", h)

svg.selectAll("rect").data(dataset).enter().append("rect").attr("x", (d, i) -> i * (w / dataset.length).attr("y", 0).attr("width", w / dataset.length - barPadding).attr("height", (d)->d)