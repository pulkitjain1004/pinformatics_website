var outputDB = uncertainDB;

function initLink(db1, db2, idnum, id){
	var splitdb1 = db1.split("/");
    var splitdb2 = db2.split("/");
    
    var c_db = splitdb1[0];
    var c_recnum = splitdb1[1];
    
    var n_db = splitdb2[0];
    var n_recnum = splitdb2[1];
    
    var centroid_ref = 0;
    var node_ref = 0;

	for (var i in outputDB) {        
        if (outputDB.hasOwnProperty(i)) {    
            if(outputDB[i].db == c_db && outputDB[i].recnum == c_recnum) {
                centroid_ref = i;
            }
            if(outputDB[i].db == n_db && outputDB[i].recnum == n_recnum) {
                node_ref = i;
            }
        }
    }


	var yes = "<button type=\"button\" id=\"yes\" onclick=\"buttonYes('"+centroid_ref+ "','" +node_ref+ "','" +id+"')\"> Yes </button>";
	var no = "<button type=\"button\" id=\"no\" onclick=\"buttonNo('"+centroid_ref+ "','" +node_ref+ "','" +id+"')\"> No </button>";
	var unkn = "<button type=\"button\" id=\"unkn\" onclick=\"buttonUnkn('"+centroid_ref+ "','" +node_ref+ "','" +id+"')\"> Unkn </button>";
	var finalLabel = yes + "&nbsp" + no + "&nbsp" + unkn;
	return finalLabel;
}

function buttonAlert(){
	var al = alert('click');
}

function linkedStatus(centroid, node, id){
    var label = "<p id=\""+ id + "\">" + node + "</p>";
    return label;
}

function buttonYes(centroid, node, id){
	outputDB[centroid]['data']['linked'] = "yes"; 
	outputDB[node]['data']['linked'] = "yes"; 
	var cent = outputDB[centroid]['data']['linked'];

	var cur = document.getElementById(id);
	cur.parentElement.innerHTML = "<p id=\""+ id + "\">" + cent + "</p>";
}

function buttonNo(centroid, node, id){
	outputDB[centroid]['data']['linked'] = "no"; 
	outputDB[node]['data']['linked'] = "no"; 
	var cent = outputDB[centroid]['data']['linked'];

	var cur = document.getElementById(id);
	cur.parentElement.innerHTML = "<p id=\""+ id + "\">" + cent + "</p>";
}

function buttonUnkn(centroid, node, id){
	outputDB[centroid]['data']['linked'] = "unkn"; 
	outputDB[node]['data']['linked'] = "unkn"; 
	var cent = outputDB[centroid]['data']['linked'];

	var cur = document.getElementById(id);
	cur.parentElement.innerHTML = "<p id=\""+ id + "\">" + cent + "</p>";
}
