function drawTable(encodedData) {

    var columns = ["rec no.", "db1", "db2", "fname", "lname", "race", "gender", "regnum", "dob", "link", "linked?"];
    // Create the table
    var table = d3.select("#area2").append("table");
    var thead = table.append("thead");

    thead.append("tr")
        .selectAll("th")
        .data(columns)
        .enter()
        .append("th")
        .text(function(column) { return column; });

    for (var i = 0; i < encodedData.length; i++){
        displayRow(table, columns, encodedData[i].encodedLbl);
    };
}

function displayRow(table, columns, row){
    var tbody = table.append("tbody");
    var rows = tbody.selectAll("tr")
        .data(row)
        .enter()
        .append("tr");

    var cells = rows.selectAll("td")
        .data(function(row) {
            return columns.map(function(column) {
                return {column: column, value: row[column]};
            });
        })
        .enter()
        .append("td")
        .attr("style", "font-family: Courier")
        .html(function(d) { return d.value; });

    // refer to     http://bl.ocks.org/nautat/4085017
}
