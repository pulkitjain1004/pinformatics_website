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
