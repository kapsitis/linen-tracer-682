var getHomeIndex = function(arg) {
	var i1 = arg.indexOf('numtheory-tales');
    var i2 = arg.indexOf('algorithms-tales');
    var i3 = arg.indexOf('visualizations-tales');
    var i4 = arg.indexOf('problembase-tales');
    var i5 = arg.indexOf('discrete-tales');
	var i6 = arg.indexOf('data-structures');
    if (i1 > 0) {
        return "../../numtheory/tales.html";
    }
    else if (i2 > 0) {
        return "../../algorithms/tales.html";
    }
    else if (i3 > 0) {
		return "../../visualizations/tales.html";
    }
    else if (i4 > 0) {
        return "../../problembase/problems.html";
    }
    else if (i5 > 0) {
        return "../../discrete/slides.html";
    }
	else if (i6 > 0) {
		return "../../data-structures/slides.html";
	}
    else {
        return "../../default/tales.html";
    }
}

// KAP
var getLogo = function() {
	var theLogo = document.createElement("img");
    theLogo.setAttribute("src","biglogo.png");
	theLogo.setAttribute("width","144");
    theLogo.setAttribute("alt","logo");
    theLogo.setAttribute("style","border:0;");

	var theLink = document.createElement("a");
    var theDest = getHomeIndex(window.location.href);
    theLink.setAttribute("href",theDest);
    theLink.setAttribute("class","image");
    theLink.appendChild(theLogo);

    var theP = document.createElement("p");
    theP.setAttribute("style","position:absolute;top:20px;left:0px;z-index:1;");
    theP.appendChild(theLink);
    return theP;
};


    // KAP
    var getYellowElt = function() {
        var theP = document.createElement("p");
        theP.setAttribute("style","background-color:yellow;z-index:1;position:absolute;top:60px;left:-30px;height:525px;width:20px;");
        return theP;
    };

    // KAP
    var getAsterisk = function() {
        var theP = document.createElement("p"); 
        theP.setAttribute("style","position:absolute;top:2px;right:-20px;z-index:1;");
	var theAsterisk = document.createElement("img");
        theAsterisk.setAttribute("src","asterisk.png");
	theAsterisk.setAttribute("width","43");
        theAsterisk.setAttribute("alt","asterisk");
        theP.appendChild(theAsterisk);
        return theP;
    };


    // KAP
    var getHead = function() {
        var theP = document.createElement("p"); 
        theP.setAttribute("style","position:absolute;top:-2px;right:-20px;z-index:1;");
	var theHead = document.createElement("img");
        theHead.setAttribute("src","head.png");
	theHead.setAttribute("width","50");
        theHead.setAttribute("alt","asterisk");
        theP.appendChild(theHead);
        return theP;
    };

    // KAP
    var getBookIcon = function() {
        var theP = document.createElement("p"); 
        theP.setAttribute("style","position:absolute;top:-2px;right:-20px;z-index:1;");
	var theBookIcon = document.createElement("img");
        theBookIcon.setAttribute("src","book-icon.png");
	theBookIcon.setAttribute("width","50");
        theBookIcon.setAttribute("alt","asterisk");
        theP.appendChild(theBookIcon);
        return theP;
    };


// KAP
var applyLogo = function() {
    var x = document.getElementsByClassName("present");
    console.log("Found first slide");
    var theLogo = getLogo();
    x[0].insertBefore(theLogo,x[0].firstChild);
};


// KAP
    var applyHeaderStyles = function() {

        for (var j = 0; j < 2; j++) {
          if (j == 0) {
            var x = document.getElementsByTagName("h1");
            console.log("Found h1 elements: " + x.length);
          } else {
            var x = document.getElementsByTagName("h2");
          }

          for (var i = 0; i < x.length; i++) {
            if (x[i].innerHTML.indexOf("lo-sample") !== -1) {
                x[i].classList.add('sample');
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'LOsample'");		
            } else if (x[i].innerHTML.indexOf("lo-summary") !== -1) {
                x[i].classList.add('summary');
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'summary'");
            } else if (x[i].innerHTML.indexOf("lo-quiz") !== -1) {
                x[i].classList.add('quiz');
		var theHead = getHead();
		x[i].parentNode.insertBefore(theHead,x[i].parentNode.firstChild);
                console.log("Added class 'quiz'");
            } else if (x[i].innerHTML.indexOf("lo-refff") !== -1) {
                x[i].classList.add('LOREFFF');
                console.log("Added class 'LOREFFF'");
            } else if (x[i].innerHTML.indexOf("lo-theory") !== -1) {
                x[i].classList.add('theory');
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'theory'");
            } else if (x[i].innerHTML.indexOf("lo-hints") !== -1) {
                x[i].classList.add('hints');
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'hints'");		
            } else if (x[i].innerHTML.indexOf("lo-soln") !== -1) {
                x[i].classList.add('soln');
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'soln'");
            } else if (x[i].innerHTML.indexOf("lo-reading") !== -1) {
                x[i].classList.add('reading');
		var theBookIcon = getBookIcon();
		x[i].parentNode.insertBefore(theBookIcon,x[i].parentNode.firstChild);
                console.log("Added class 'reading'");		
            } else if (x[i].innerHTML.indexOf("lo-strategies") !== -1) {
                x[i].classList.add('strategies');
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'strategies'");		
            } else if (x[i].innerHTML.indexOf("lo-yellow") !== -1) {
                x[i].classList.add('yellow');
                var theYellowElt = getYellowElt();
		x[i].parentNode.insertBefore(theYellowElt,x[i].parentNode.firstChild);
		var theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'yellow'");
            } else if (x[i].innerHTML.indexOf("lo-why") !== -1) {
                x[i].parentNode.classList.add('LOwhy');
            } else {
                x[i].classList.add('default');
            }
          }
        }

    };


window.addEventListener("load", function(){
	var x = document.getElementsByClassName("slides")[0].childNodes;
	console.log("x.length is " + x.length);	
	count = 0; 
	for (i = 0; i < x.length; i++) {
		if (x[i].tagName && x[i].tagName.toUpperCase() === "SECTION") {
			if (x[i].childNodes.length > 0) {
				if (x[i].childNodes[0]) {
					if (x[i].childNodes[0].hasAttribute("id")) {
						if (x[i].childNodes[0].id === "") {
							console.log("elt[" + i + "] = '" + x[i].childNodes[0].id + "'");
							x[i].id = "section-" + count;
							count++;
						}
					}
				}
			}
		}	
	}
	applyLogo();
	applyHeaderStyles();
});


