// load uncertain DB csv file
var remaining = 2;
var uncertainDB = [];  // fully disclosed database
var clustDB = [];      // cluster database

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
    clustDB = data;         
    if (!--remaining) init(); 
});

var encodedData = [];

function init() {
    var db, recnum;
    var rec = 0;

    for(clustid in clustDB) {
        var cluster = clustDB[clustid];
        
        var c = getCentroid(cluster.values.length); // get centroid record number
        var centroid = cluster.values[c]; 
                
        //console.log("centroid", centroid, centroid.db, centroid.recnum);        
        //console.log(getRow(uncertainDB, centroid.db, centroid.recnum));
        

        var encodedRow = [];
        var centroid_row = [];
        var node_row =[];
        
        // from the uncertainDB database, get centroid data values
        centroid_row = getRow(uncertainDB, centroid.db, centroid.recnum); 
        
        for(node in cluster.values) {
            if (node == c) continue;  // if selected node is centroid, skip                
            rec++;
                        
            db = cluster.values[node].db;         // get db number
            recnum = cluster.values[node].recnum; // get record number
            
            //console.log(db, recnum);
            //console.log(getRow(uncertainDB, db, recnum)); 
            
            node_row = getRow(uncertainDB, db, recnum); // get node data            
            
            
            encodedRow = getEncodedRow(centroid_row, node_row, centroid, db, recnum, rec); // compare centroid with the node and encode it

            encodedData.push({
            "clustid" : clustid,
            "centroid": { "db" : centroid.db, "recnum": centroid.recnum },
            "node": { "db" : db, "recnum": recnum },            
            "encodedLbl" : encodedRow
            });

        }
    }
    
    console.log(JSON.stringify(encodedData));
    
    drawTable(encodedData);
    
}

// return random centroid
function getCentroid(nclust){    
    return Math.floor(Math.random() * nclust);  // random selection
}

function getEncodedRow(centroid, node, cent, nodedb, nodern, num) {

    var encodedRow = [];

    var db1 = cent.db + "/" + cent.recnum;
    var db2 = nodedb + "/" + nodern;

    var idnum = cent.recnum + nodern;
    
    var fnlbl = stringEncode(centroid.fname, node.fname, idnum + "fn");

    var lnlbl = stringEncode(centroid.lname, node.lname, idnum + "ln");

    var racelbl = binaryEncode(centroid.race, node.race, idnum + "ra");

    var genderlbl = binaryEncode(centroid.gender, node.gender, idnum + "ge");

    var rgnumlbl = idEncode(centroid.regnum, node.regnum, idnum + "rg");

    var doblbl = dobEncode(centroid.dob, node.dob, idnum + "dob");
    

    //console.log("c", centroid, "n", node);
    //console.log("fnlbl", fnlbl, "lnlbl", lnlbl, "rlbl", racelbl , "glbl", genderlbl, "rgnum", rgnumlbl, "dob" , doblbl);
    
    encodedRow.push({
            "rec no." : num,
            "db1" : db1,
            "db2" : db2,
            "fname" : fnlbl, 
            "lname" : lnlbl, 
            "race"  : racelbl, 
            "gender" : genderlbl,                
            "regnum" : rgnumlbl,
            "dob" : doblbl
    });

    return encodedRow;
}


// get row values with db and recnum
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


/*
UNUSED - get row distance function
function getRowDist(centroid, node)
{
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

*/
