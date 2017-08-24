function getRow(data, db, recnum) {
    var temp = [];
    
    for (var i in data) {        
        if (data.hasOwnProperty(i)) {    
            if(data[i].db == db && data[i].recnum == recnum) {
                return data[i].data;
            }
        }
    }
    
    return temp;
}

// load uncertain DB csv file
var remaining = 2;
var uncertainDB = [];
var clustdb = [];

d3.csv("../data/uncertain_db.csv", function(error, csv) {
    csv.forEach(function(d) {
        uncertainDB.push({
            "db" : d.db, 
            "recnum" : d.recnum,
            "data" : {
                "fname" : d.fname, 
                "lname" : d.lname, 
                "race"  : d.race, 
                "gender" : d.gender,
                "dob" : d.dob,
                "regnum" : d.reg_num
                }
            }
        )});
   
    if (!--remaining) init();
    
});

// load cluster DB csv file
d3.csv("../data/cluster.csv", function(error, csv) {
                    
    var data = d3.nest()
        .key(function(d) { return d.clustid; })
        .entries(csv);
    clustdb = data;         
    if (!--remaining) init();
});

var db, recnum;

function init() {
    
    for(clustid in clustdb) {
        var cluster = clustdb[clustid];
        
        var c = getCentroid(cluster.values.length); // get centroid record number
        var centroid = cluster.values[c]; // centroid
        
        getCentroid2(cluster);
        
        //console.log("centroid", centroid, centroid.db, centroid.recnum);        
        //console.log(getRow(uncertainDB, centroid.db, centroid.recnum));
        
        var centroid_row = [];
        var node_row =[];
        centroid_row = getRow(uncertainDB, centroid.db, centroid.recnum);
        
        for(node in cluster.values) {
            if (node == c) continue;
            
            
            
            db = cluster.values[node].db;
            recnum = cluster.values[node].recnum;
            
            //console.log(db, recnum);
            //console.log(getRow(uncertainDB, db, recnum)); 
            
            node_row = getRow(uncertainDB, db, recnum);
            
            getRowDist(centroid_row, node_row);
            
        }
            
        
        //console.log("full data" , cluster.values);
        //console.log("nclust:", clustdb[clust].values.length, "centroid: ", c);        
        //console.log(getEditDist("apple", "John"));
    }

    
    console.log(uncertainDB);
    console.log(clustdb);
    /*
    console.log(getRow(uncertainDB, "709", "13126"));
    console.log(getRow(uncertainDB, "709", "6"));
    console.log(getRow(uncertainDB, "829", "1321"));
    */
    
    

    
    console.log('5917780 / 5971870', jaroWinkler('5917780','5971870'));
    
    
//    console.log(data);
//    console.log(clustdb)
    
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

function getCentroid2(cluster) {    
   
    var matrix = [][]; // size: nclust * nclust
    
    var nclust = cluster.length; // cluster size
    
    var i;
    for(i = 0; i <= nclust; i++) {
        for(j=i+1; j<=nclust; j++) {
            matrix[i][j] = getRowDist(i(data), j(data));
        }
    }
 

}

function getCentroid(nclust) {    
    return Math.floor(Math.random() * nclust);  // random selection
}

function getRowDist(centroid, node)
{
    // use jaro 
    
    var rowdist = 0;
    
    var fndist = getEditDist(centroid.fname, node.fname);
    var lndist = getEditDist(centroid.lname, node.lname);
    var rdist = getBinaryDist(centroid.race, node.race);
    var gdist = getBinaryDist(centroid.gender, node.gender);
    var dobdist = getBinaryDist(centroid.dob, node.dob);
    //var rgdist = getIdentityDist();
    
    // get distance between centroid and the node
    console.log("c", centroid, "n", node);
    console.log("fndist", fndist, "lndist", lndist, "rdist", rdist , "gdist", gdist);
    // fname,lname,regnum,dob,gender,race
    
    return rowdist;
}


function calcDist() {

}

