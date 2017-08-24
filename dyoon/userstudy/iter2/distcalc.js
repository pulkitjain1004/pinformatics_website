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

function jaro(str1, str2) {
    var lenStr1 = str1.length,
        lenStr2 = str2.length,
        matchWindow = Math.max(lenStr1, lenStr2)/2-1,
        transpositions=0,
        matches=0,
        letter='';
      
    // Test if swapping strX & lenStrX if stra is longer then str2 for proformance ??
    // another option is to bail out of the stepping once we are outside of the context of the other string
    // the issue is that with string lengths of 11 & 2 you wouldn't want to go through the loop 11 times
  
    /* find matches & transpositions */
    for (var i in str2) {
        letter = str2[i];
        if(str1.slice(i,i+matchWindow).indexOf(letter) > -1) { /* match */
            matches++;
        } else if(str1.slice(i-matchWindow,i).indexOf(letter) > -1) { /* transposition */
            matches++; transpositions++;
        }
    };
    return (1/3*(matches/lenStr1+matches/lenStr2+(matches-transpositions)/matches));
}

function jaroWinkler (str1, str2, p) {
    p = p || 0.1;
    var dj = jaro(str1,str2), l=0; 
  
    for(var i=0; i<4; i++) { /* find length of prefix match (max 4) */
        if(str1[i]==str2[i]){ l++; } else { break; } 
    }
  
    return dj+(l*p*(1-dj));
}

String.prototype.score = function(abbreviation) {
    return jaroWinkler(this.toLowerCase(),abbreviation.toLowerCase());
};

// console.log('martha '+'martha'.score('marhta'));
// console.log('martha '+jaroWinkler('martha','marhta'));
// console.log('dwayne '+jaroWinkler('DWAYNE','DUANE'));

var getIdentityDist = function(s1, s2) {
    
    var dist = 0;
    if(s1.length != s2.length) {
        return -1;
    }
    
    
    
    // transpose
    
    
    return match;
    
}


//  Calculating the Hamming Distance for two strings requires the string to be of the same length.
function getBinaryDist(s1, s2) {
    
    if(s1.length != s2.length) {
        return -1;
    }
    
    var dist = 0;
    
    for(var i=0; i < s1.length; i++) {
        if(s1[i] != s2[i]) {
            dist++;
        }
    }
        
    return dist;              
}


// Compute the edit distance between the two given strings
function getEditDist(s1, s2) {
    
    if(s1.length === 0) return s1.length; 
    if(s2.length === 0) return s2.length; 
    
    var matrix = [];
 
    // increment along the first column of each row
    var i;
    for(i = 0; i <= s2.length; i++) {
        matrix[i] = [i];
    }
 
    // increment each column in the first row
    var j;
    for(j = 0; j <= s1.length; j++) {
        matrix[0][j] = j;
    }
 
    // Fill in the rest of the matrix
    for(i = 1; i <= s2.length; i++) {
        for(j = 1; j <= s1.length; j++) {
            if(s2.charAt(i-1) == s1.charAt(j-1)) {
                matrix[i][j] = matrix[i-1][j-1];
            } else {
                matrix[i][j] = Math.min(matrix[i-1][j-1] + 1, // substitution
                                        Math.min(matrix[i][j-1] + 1, // insertion
                                        matrix[i-1][j] + 1)); // deletion
                }
        }
    }
    return matrix[s2.length][s1.length];
}