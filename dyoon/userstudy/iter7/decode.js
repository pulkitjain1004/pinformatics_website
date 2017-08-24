// function expand(s1, s2, id){
//     var cur = document.getElementById(id);
//     cur.parentElement.innerHTML = s1 + "<br>" + s2;
// }

function stringDecode(centroid, node, encoded, id){
 	var s1 = ""; //centroid fname to display
 	var s2 = ""; //node fname to display
	budgetCalc();
	if (encoded == "Diff"){ // check for "Diff" and display for full name
		s1 = centroid;
		s2 = node;
		var cur = document.getElementById(id);
		cur.parentElement.innerHTML = s1 + "<br>" + s2;
	}
	else{
		for (var i = 0; i < encoded.length; i++){ // check for "D" and only display that letter
			if (centroid.charAt(i) == node.charAt(i)){
				s1 += "-";
				s2 += "-";
			}
			else{
				s1 += centroid.charAt(i);
				s2 += node.charAt(i);
			}
		}
		var cur = document.getElementById(id);
		var id2 = id + "2";

		cur.parentElement.innerHTML = "<a id=\""+id2+ "\" onclick=\"stringDecode2('" +centroid+ "','" +node+ "','" +id2+"')\">"
									  +	s1 + "<br>" + s2 + "</a>";
	}
}

function stringDecode2(centroid, node, id){
	var s1 = centroid;
	var s2 = node;
	var cur = document.getElementById(id);
	budgetCalc();

	cur.parentElement.innerHTML = s1 + "<br>" + s2;
}

function binaryDecode(centroid, node, encoded, id){
	var s1 = "";
	var s2 = "";

	budgetCalc();

	if (encoded == "M") {
		if (centroid == "" && node == ""){
			s1 = "(M)";
			s2 = "(M)";
		}
		else{
			if (centroid == ""){
				s1 = "(M)";
				s2 = node;
			}
			else{
				s1 = centroid;
				s2 = "(M)"
			}
		}
		var cur = document.getElementById(id);
		cur.parentElement.innerHTML = s1 + "<br>" + s2;
	}
	else{
		s1 = centroid;
		s2 = node;
		var cur = document.getElementById(id);
		cur.parentElement.innerHTML = s1 + "<br>" + s2;
	}
}

function idDecode(centroid, node, encoded, id){
	var s1 = "";
	var s2 = "";

	budgetCalc();

	if (encoded == "Diff"){ // check for "Diff" and display for full name
		s1 = centroid;
		s2 = node;
		var cur = document.getElementById(id);
		cur.parentElement.innerHTML = "**";
	}
	else{
		for (var i = 0; i < encoded.length; i++){ // check for "D" and only display that letter
			if (centroid.charAt(i) == node.charAt(i)){
				s1 += "-";
				s2 += "-";
			}
			else{
				s1 += centroid.charAt(i);
				s2 += node.charAt(i);
			}
		}
		var cur = document.getElementById(id);
		cur.parentElement.innerHTML = s1 + "<br>" + s2;
	}
}

function dobDecode(m1, m2, d1, d2, y1, y2, id){
	var s1 = m1 + "/" + d1 + "/" + y1;
	var s2 = m2 + "/" + d2 + "/" + y2;
	var cur = document.getElementById(id);
	cur.parentElement.innerHTML = s1 + "<br>" + s2;

	budgetCalc();	
}

// function dobDecode(centroid, node, encoded, id){
// 	var s1 = "";
// 	var s2 = "";

// 	if(encoded == "TX"){

// 	}
// }