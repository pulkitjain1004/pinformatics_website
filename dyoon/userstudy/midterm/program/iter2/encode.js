var nameEncode = function(name1, name2) {
    var match = "";         
             
    if (name1 == "(MISSING)" || name2 == "(MISSING)") {
        return match = "M";
    } 
    
    if(name1 == name2) {
        for(var i=0; i<name1.length; i++) {
            match += "-";
        }
    } else {
        var strlen = (name1.length>=name2.length) ? name1.length:name2.length; // get longer string length
        var diffcount = 0;
        for(var i=0; i<strlen; i++) {           
            if(name1[i] == name2[i]) {
                match += "-";
            }
            else {
                match += "D";
                diffcount++;
            }
        }
        
        if(diffcount >=2) { // check for moe than one letter difference
            match = "Diff";
        }
            
    }
    
    
    return match; 
}


var dobEncode = function(dob1, dob2) {
    var match = "";
    
    if(dob1 == dob2) { // check for exact match
        return match = "--/--/----";
    }
    
    var splitdate1 = dob1.split("/");
    var splitdate2 = dob2.split("/");
    
    var m1 = splitdate1[0];
    var d1 = splitdate1[1];
    var y1 = splitdate1[2];
    
    var m2 = splitdate2[0];
    var d2 = splitdate2[1];
    var y2 = splitdate2[2];
    
    var mm="";
    for(var i=0; i<d1.length; i++) {
        if(m1[i] == m2[i]) {
            mm += "-";
        }
        else {
            mm += "D";
        }
    } 
    
    var dm="";
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


var ssnEncode = function(ssn1, ssn2) {
    var match = "";
    
    ssn1 = ssn1.replace(/-/g , ""); // remove '-'
    ssn2 = ssn2.replace(/-/g , "");
    
    
    // check for missing
    if(ssn1=="" || ssn2=="" || ssn1=="(MISSING)" || ssn2=="(MISSING)") {        
        return match = "M";
    }
    
    // check for exact match
    if(ssn1 == ssn2)
        return match="---------";
    
    // check for transpose
    var diff = 0;
    for(var i=0; i<=7; i++) {           
        
        if(ssn1[i] == ssn2[i]) {
            match += "-";
        }
        else {
            match += "D";
            diff++;
        }
    }
    
    var t=match.indexOf("DD");
    if(diff > 2) {
        match = "DIFF";
    } else if(diff == 2 && t >= 0) {
        if(ssn1[t] == ssn2[t+1] && ssn2[t] == ssn1[t+1]) {            
            match = match.replace("DD", "TX");
        }
    }
    
    return match;
    
}

var genderEncode = function(g1, g2) {
    
    var match = "";
    if (g1 == "(MISSING)" || g2 == "(MISSING)") {
        return match = "M";
    } 
    
    if(g1 == g2) {
        match = "-";
    } else if(g1 != g2) {
        match = "D";
    }                   
    
    return match;                  
}
