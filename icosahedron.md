# Icosahedron by Mike Bostock notation

## create variables

### create width and hight of the svg
```javascript
var width = 960,
    height = 500;
```
### define origin and velocity
```javascript
var origin = [0, 0],
    velocity = [.18, .06];
```
### create the projection.  2d (nonlinear) scale?
```javascript
var projection = d3.geo.azimuthal()
    .mode("orthographic")
    .origin(origin)
    .scale(240);
```
## Create views
### Create svg
```javascript
var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);
```
### create faces
```javascript
var face = svg.selectAll(".face")
    .data(icosahedron_faces)
  .enter().append("path")
    .attr("class", "face");
```
### create edget
```javascript
var edge = svg.selectAll(".edge")
    .data(icosahedron_edges)
  .enter().append("path")
    .attr("class", "edge");
```
### create points
```javascript
var point = svg.selectAll(".point")
    .data(icosahedron_points)
  .enter().append("circle")
    .attr("class", "point")
    .attr("r", 3.5);
```
## repeated loop
```javascript
d3.timer(function() {
  origin[0] += velocity[0];
  origin[1] += velocity[1];
  projection.origin(origin);
  draw();
});
```
## Data
### Construct and reconstruct points
```javascript
function icosahedron_points() {
  var points = [],
      y = Math.atan2(1, 2) * 180 / Math.PI;
  points.push([0, -90]);
  for (var x = 0; x < 360; x += 36) {
    points.push([x, -y], [x += 36, y]);
  }
  points.push([0, 90]);
  return points;
}
```
### construct and reconstruct edges

```javascript
function icosahedron_edges() {
  var edges = [],
      y = Math.atan2(1, 2) * 180 / Math.PI;
  for (var x = 0; x < 360; x += 72) {
    edges.push([[x +  0, -90], [x +  0,  -y]]);
    edges.push([[x +  0,  -y], [x + 72,  -y]]);
    edges.push([[x + 36,   y], [x - 36,   y]]);
    edges.push([[x + 36,   y], [x +  0,  -y]]);
    edges.push([[x - 36,   y], [x +  0,  -y]]);
    edges.push([[x + 36,  90], [x + 36,   y]]);
  }
  return edges;
}
```
### construct and reconstruct faces
```javascript
function icosahedron_faces() {
  var faces = [],
      y = Math.atan2(1, 2) * 180 / Math.PI;
  for (var x = 0; x < 360; x += 72) {
    faces.push([[x +  0, -90], [x +  0,  -y], [x + 72,  -y], [x +  0, -90]]);
    faces.push([[x +  0,  -y], [x + 72,  -y], [x + 36,   y], [x +  0,  -y]]);
    faces.push([[x + 36,   y], [x +  0,  -y], [x - 36,   y], [x + 36,   y]]);
    faces.push([[x - 36,  90], [x - 36,   y], [x + 36,   y], [x + 36,  90]]);
  }
  return faces;
}
```
## draw new configuration
```javascript
function draw() {
  point.attr("transform", function(d) { return "translate(" + projection(d) + ")"; });
  edge.attr("d", function(d) { return "M" + d.map(projection).join("L"); });
  face.attr("d", function(d) { return "M" + d.map(projection).join("L"); });
}
```