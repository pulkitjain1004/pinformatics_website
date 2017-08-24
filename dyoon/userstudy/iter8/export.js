function outputButton(){
	var button = "<button type=\"button\" id=\"save\" onclick=\"save()\"> Save </button>";
    
    var attach = d3.select("#area1")
    .append("g")
    .html(button);
}

function save(){
	var th = ["fname", "lname", "race", "gender", "reg_num", "dob", "db", "recnum", "linked"];
	var out = [];

	out.push(th);

	for (var i in outputDB){
		var temp = [outputDB[i]['data']['fname'],
					outputDB[i]['data']['lname'],
					outputDB[i]['data']['race'],
					outputDB[i]['data']['gender'],
					outputDB[i]['data']['reg_num'],
					outputDB[i]['data']['dob'],
					outputDB[i]['db'],
					outputDB[i]['recnum'],
					outputDB[i]['data']['linked']
		]
		out.push(temp);
	}

	var csvContent = "data:text/csv;charset=utf-8,";

	out.forEach(function(infoArray, index){
	   dataString = infoArray.join(",");
	   csvContent += index < outputDB.length ? dataString+ "\n" : dataString;
	}); 

	var encodedUri = encodeURI(csvContent);
	var link = document.createElement("a");
	link.setAttribute("href", encodedUri);
	link.setAttribute("download", "output.csv");

	link.click();
}