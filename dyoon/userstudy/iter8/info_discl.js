function budgetAndDiscolsed(budget){
    var total = "<a id=\"pb\">" + budget + "</a>";
    var start = "<a id=\"info\">" + 0 + "%" + "</a>";
    changeBudget = budget;

    var encodingLabel = [
        { "label": "Privacy Budget", "text": total, "color": "red" }, 
        { "label": "Info. Discosure", "text": start, "color": "red" }];

    var labelGroup = svg.append("g");            
    var label = labelGroup.selectAll("text")
    .data(encodingLabel)
    .enter()
    .append("text");
    var tw = 500, ty = 30;
    var labels = label
    .attr("x", tw)
    .attr("y", function(d) { ty = ty + 30; return ty; })
    .text(function (d) { return d.label + " : "; })
    .attr("font-family", "sans-serif")
    .attr("fill", function(d) { return d.color; });

    var textGroup = svg.append("g");
    var textLabel = textGroup.selectAll("text")
    .data(encodingLabel)
    .enter()
    .append("text");            
    
    ty = 30;
    var texts = textLabel
    .attr("x", tw + 110)
    .attr("y", function(d) { ty = ty + 30; return ty; })
    .html(function (d) { return d.text; })
    .attr("font-family", "sans-serif")
    .attr("fill", "Black" );

    var info = svg.append("rect")
    .attr("width", 230)
    .attr("height", 100)
    .attr("x", 490)
    .attr("y", 20)
    .style("fill", "none")
    .attr("stroke", "black");
}            


function budgetCalc(){
    var pbid = "pb";
    var oldBudget = changeBudget;
    changeBudget = oldBudget - 1;
    var newBudget = changeBudget;
    var newValue = document.getElementById(pbid);
    newValue.parentElement.innerHTML = "<a id=\"pb\">" + newBudget + "</a>";

    var infoid = "info";
    var disc = 100 - (changeBudget / budget * 100);
    var discF = disc.toFixed(2);
    var discString = discF + "%";
    var newDisc = document.getElementById(infoid);
    newDisc.parentElement.innerHTML = "<a id=\"info\">" + discString + "</a>";
}