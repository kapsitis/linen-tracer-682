var uu = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQiWJryFXmfCZZFhmvb7RGeS46fTbSeZkM4mZt_78ioUVSqIInUw2bsl0el4YZ4sHga8nzohP3pOAT_/pub?gid=0&single=true&output=csv'
var vv = 'SirdsDati.csv'

// gridlines in x axis function
function make_x_gridlines() {		
    return d3.axisBottom(x)
        .ticks(5)
}

// gridlines in y axis function
function make_y_gridlines() {		
    return d3.axisLeft(y)
        .ticks(5)
}


d3.csv(uu, function (data) {
  // https://docs.google.com/spreadsheets/d/e/2PACX-1vQiWJryFXmfCZZFhmvb7RGeS46fTbSeZkM4mZt_78ioUVSqIInUw2bsl0el4YZ4sHga8nzohP3pOAT_/pub?gid=0&single=true&output=csv
  // Variables
  var body = d3.select('body')
	var margin = { top: 50, right: 50, bottom: 50, left: 50 }
	var h = 500 - margin.top - margin.bottom
	var w = 500 - margin.left - margin.right
	var formatPercent = d3.format('.2%')
	// Scales
  var colorScale = d3.scale.category20()
  var xScale = d3.scale.linear()
      //.domain(d3.extent(data, function(d) { return d.Rate1 }))
    .domain([
    	d3.min([60,d3.min(data,function (d) { return d.Rate1 })]),
    	d3.max([90,d3.max(data,function (d) { return d.Rate1 })])
    	])
    .range([0,w])
  var yScale = d3.scale.linear()
    .domain([
    	d3.min([50,d3.min(data,function (d) { return d.Rate2 })]),
    	d3.max([120,d3.max(data,function (d) { return d.Rate2 })])
    	])
    .range([h,0])
	// SVG
	var svg = body.append('svg')
	    .attr('height',h + margin.top + margin.bottom)
	    .attr('width',w + margin.left + margin.right)
	  .append('g')
	    .attr('transform','translate(' + margin.left + ',' + margin.top + ')')
	// X-axis
	var xAxis = d3.svg.axis()
	  .scale(xScale)
	  //.tickFormat(formatPercent)
	  .ticks(5)
	  .orient('bottom')
  // Y-axis
	var yAxis = d3.svg.axis()
	  .scale(yScale)
	  //.tickFormat(formatPercent)
	  .ticks(5)
	  .orient('left')
  // Circles
  var circles = svg.selectAll('circle')
      .data(data)
      .enter()
    .append('circle')
      .attr('cx',function (d) { return xScale(d.Rate1) })
      .attr('cy',function (d) { return yScale(d.Rate2) })
      .attr('r','4')
      .attr('stroke','black')
      .attr('stroke-width',1)
      .attr('fill',function (d,i) { return colorScale(i) })
      .on('mouseover', function () {
        d3.select(this)
          .transition()
          .duration(500)
          .attr('r',8)
          .attr('stroke-width',3)
      })
      .on('mouseout', function () {
        d3.select(this)
          .transition()
          .duration(500)
          .attr('r',4)
          .attr('stroke-width',1)
      })
    .append('title') // Tooltip
      .text(function (d) { return d.ID +
                           '\nGender: ' + d.Gender +
                           '\nAge: ' + d.Age })
  
 
  // X-axis
  svg.append('g')
      .attr('class','axis')
      .attr('transform', 'translate(0,' + h + ')')
      .call(xAxis)
    .append('text') // X-axis Label
      .attr('class','label')
      .attr('y',-10)
      .attr('x',w)
      .attr('dy','.71em')
      .style('text-anchor','end')
      .text('Miera pulss')

  // Y-axis
  svg.append('g')
      .attr('class', 'axis')
      .call(yAxis)
    .append('text') // y-axis Label
      .attr('class','label')
      .attr('transform','rotate(-90)')
      .attr('x',0)
      .attr('y',5)
      .attr('dy','.71em')
      .style('text-anchor','end')
      .text('Stresa pulss')

/*
 // add the X gridlines
  svg.append("g")			
      .attr("class", "grid")
      .attr("transform", "translate(0," + height + ")")
      .call(make_x_gridlines()
          .tickSize(-height)
          .tickFormat("")
      )

  // add the Y gridlines
  svg.append("g")			
      .attr("class", "grid")
      .call(make_y_gridlines()
          .tickSize(-width)
          .tickFormat("")
      )
*/
      
      
})
