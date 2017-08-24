var stringEncode = function(s1, s2) {
    var encodedLbl = "";  // set encoded label to empty string       
             
    // check for missing 
    if (s1 == "" || s2 == "" || s1 == "(MISSING)" || s2 == "(MISSING)" ) {
        return encodedLbl = "M";
    } 
    
    // check for exact match
    if(s1 == s2) {
        for(var i=0; i<s1.length; i++) {
            encodedLbl += "-";
        }
    } else {
        var strlen = (s1.length>=s2.length) ? s1.length:s2.length; // get longer string length
        var diffcount = 0;
        for(var i=0; i<strlen; i++) {           
            if(s1[i] == s2[i]) {
                encodedLbl += "-";
            }
            else {
                encodedLbl += "D";
                diffcount++;
            }
        }
        
        if(diffcount >=2) { // check for more than one letter difference
            encodedLbl = "Diff";
        }            
    }
    
    return encodedLbl; // return encoded label
}


var dobEncode = function(dob1, dob2) {
    var encodedLbl = "";
    
    // check for missing
    if (dob1 == "" || dob2 == "" || dob1 == "(MISSING)" || dob2 == "(MISSING)" ) {
        return encodedLbl = "M";
    } 
    
    if(dob1 == dob2) { // check for exact match
        return encodedLbl = "--/--/----";
    }
    
    var splitdate1 = dob1.split("/");
    var splitdate2 = dob2.split("/");
    
    var m1 = splitdate1[0];
    var d1 = splitdate1[1];
    var y1 = splitdate1[2];
    
    var m2 = splitdate2[0];
    var d2 = splitdate2[1];
    var y2 = splitdate2[2];
    
    var mm = "";
    for(var i=0; i<m1.length; i++) {
        if(m1[i] == m2[i]) {
            mm += "-";
        }
        else {
            mm += "D";
        }
    } 
    
    var dm = "";
    for(var i=0; i<d1.length; i++) {
        if(d1[i] == d2[i]) {
            dm += "-";
        }
        else {
            dm += "D";
        }
    }
    
    var ym="";
    var ydiff = 0;
    for(var i=0; i<y1.length; i++) {
        if(y1[i] == y2[i]) {
            ym += "-";
        }
        else {
            ym += "D";
            ydiff++;
        }
    }
    var t=ym.indexOf("DD");
    if(ydiff == 2 && t >= 0) {
        if(y1[t] == y2[t+1] && y2[t] == y1[t+1]) {
            ym = ym.replace("DD", "TX");
        }
    }
    
    //check for month-day transpose
    if(m1 == d2 && m2 == d1) {
        mm = "T";
        dm = "X";
    }    
    // check month transpose
    if(m1[0] == m2[1] && m2[0] == m1[1]) {
        mm = "TX";
    }
    // check day transpose
    if(d1[0] == d2[1] && d2[0] == d1[1]) {
        dm = "TX";
    }
    
    return mm+"/"+dm+"/"+ym;    
}


var idEncode = function(id1, id2) {
    var encodedLbl = "";
    
    id1 = id1.replace(/-/g , ""); // remove '-'
    id2 = id2.replace(/-/g , "");
    
    
    // check for missing
    if(id1=="" || id2=="" || id1=="(MISSING)" || id2=="(MISSING)") {        
        return encodedLbl = "M";
    }
    
    // check for exact match
    if(id1 == id2)
        return encodedLbl="---------";
    
    // check for transpose
    var diff = 0;
    for(var i=0; i<=7; i++) {           
        
        if(id1[i] == id2[i]) {
            encodedLbl += "-";
        }
        else {
            encodedLbl += "D";
            diff++;
        }
    }
    
    var t=encodedLbl.indexOf("DD");
    if(diff > 2) {
        encodedLbl = "DIFF";
    } else if(diff == 2 && t >= 0) {
        if(id1[t] == id2[t+1] && id2[t] == id1[t+1]) {            
            encodedLbl = encodedLbl.replace("DD", "TX");
        }
    }
    
    return encodedLbl;
    
}

var binaryEncode = function(b1, b2) {    
    var encodedLbl = "";
    
    if (b1 == "" || b2 == "" || b1 == "(MISSING)" || b2 == "(MISSING)") {
        return encodedLbl = "M";
    } 
    
    if(b1 == b2) {
        encodedLbl = "-";
    } else {
        encodedLbl = "D";
    }                   
    
    return encodedLbl;                  
}
