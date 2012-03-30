/* OM ERRORAYA NAMAHA */

var c1 = 0;
var rt = 0;
var rtcount = 0;
var timeEnd = 3;
var score = 0;
var tempArray = new Array(3);
var playingFirst = 1;

var count = 0;
var playMode = 2;
var gameDuration = 3000;

var coordinate = new Array(3);

coordinate[0] = new Array(2);
coordinate[1] = new Array(2);
coordinate[2] = new Array(2);

var cArray = new Array(3);
var cTextArray = new Array(3);

/////// ONLY BALLS //////////////
function staticCoordGen()
{
    //y coord of RED
    coordinate[0][1] = 164;
    //x coord of RED
    coordinate[0][0] = 107;

    //y coord of GREEN
    coordinate[1][1] = 164;
    //x coord of GREEN
    coordinate[1][0] = 297;


    //y coord of BLUE
    coordinate[2][1] = 164;
    //x coord of BLUE
    coordinate[2][0] = 483;

}

function randomCoordGen()
{
    //x coord of RED
    coordinate[0][1] = 35 + (Math.floor(Math.random()*1000)%250);
    //y coord of RED
    coordinate[0][0] = 5 + (Math.floor(Math.random()*1000)%133);

    //x coord of GREEN
    coordinate[1][1] = 35 + (Math.floor(Math.random()*1000)%250);
    //y coord of GREEN
    coordinate[1][0] = 217 + (Math.floor(Math.random()*1000)%137);


    //x coord of BLUE
    coordinate[2][1] = 35 + (Math.floor(Math.random()*1000)%250);
    //y coord of BLUE
    coordinate[2][0] = 433 + (Math.floor(Math.random()*1000)%133);

}


function assignRand()
{
    while(1)
    {
        if(playingFirst == 1)
        {
            playingFirst = 0;

            cArray[0] = (Math.floor(Math.random()*10)%3);

            if(cArray[0] == 0) {
                cArray[1] = 1 + (Math.floor(Math.random()*10)%2);
                if(cArray[1] == 1) {
                    cArray[2] = 2;
                }
                else {
                    cArray[2] = 1;
                }
            }
            else if(cArray[0] == 1) {
                var temp = (Math.floor(Math.random()*10)%2);
                if(temp == 0) {
                    cArray[2] = 0;
                    cArray[1] = 2;
                }
                else {
                    cArray[2] = 2;
                    cArray[1] = 0;
                }
            }
            else if(cArray[0] == 2) {
                cArray[1] = (Math.floor(Math.random()*10)%2);
                if(cArray[1] == 1) {
                    cArray[2] = 0;
                }
                else {
                    cArray[2] = 1;
                }
            }

            tempArray[0] = cArray[0];
            tempArray[1] = cArray[1];
            tempArray[2] = cArray[2];
            break;


        }
        else if(playingFirst == 0)
        {
            cArray[0] = (Math.floor(Math.random()*10)%3);

            if(cArray[0] == 0) {
                cArray[1] = 1 + (Math.floor(Math.random()*10)%2);
                if(cArray[1] == 1) {
                    cArray[2] = 2;
                }
                else {
                    cArray[2] = 1;
                }
            }
            else if(cArray[0] == 1) {
                var temp = (Math.floor(Math.random()*10)%2);
                if(temp == 0) {
                    cArray[2] = 0;
                    cArray[1] = 2;
                }
                else {
                    cArray[2] = 2;
                    cArray[1] = 0;
                }
            }
            else if(cArray[0] == 2) {
                cArray[1] = (Math.floor(Math.random()*10)%2);
                if(cArray[1] == 1) {
                    cArray[2] = 0;
                }
                else {
                    cArray[2] = 1;
                }
            }

            if(tempArray[0] == cArray[0] && tempArray[1] == cArray[1]) {
                continue;
            }
            else {
                tempArray[0] = cArray[0];
                tempArray[1] = cArray[1];
                tempArray[2] = cArray[2];
                break;
            }

        }
    }

 }


/////////////////////////////////

/////// BALLS + TEXT //////////////
function staticCoordGenText()
{
    //y coord of RED
    coordinate[0][1] = 164;
    //x coord of RED
    coordinate[0][0] = 107;

    //y coord of GREEN
    coordinate[1][1] = 164;
    //x coord of GREEN
    coordinate[1][0] = 297;


    //y coord of BLUE
    coordinate[2][1] = 164;
    //x coord of BLUE
    coordinate[2][0] = 483;

}

function randomCoordGenText()
{
    //x coord of RED
    coordinate[0][1] = 35 + (Math.floor(Math.random()*1000)%250);
    //y coord of RED
    coordinate[0][0] = 5 + (Math.floor(Math.random()*1000)%133);

    //x coord of GREEN
    coordinate[1][1] = 35 + (Math.floor(Math.random()*1000)%250);
    //y coord of GREEN
    coordinate[1][0] = 217 + (Math.floor(Math.random()*1000)%137);


    //x coord of BLUE
    coordinate[2][1] = 35 + (Math.floor(Math.random()*1000)%250);
    //y coord of BLUE
    coordinate[2][0] = 433 + (Math.floor(Math.random()*1000)%133);

}

function assignRandText()
{
    cArray[0] = (Math.floor(Math.random()*10)%3);

    if(cArray[0] == 0) {
        cArray[1] = 1 + (Math.floor(Math.random()*10)%2);
        if(cArray[1] == 1) {
            cArray[2] = 2;
        }
        else {
            cArray[2] = 1;
        }
    }
    else if(cArray[0] == 1) {
        var temp = (Math.floor(Math.random()*10)%2);
        if(temp == 0) {
            cArray[2] = 0;
            cArray[1] = 2;
        }
        else {
            cArray[2] = 2;
            cArray[1] = 0;
        }
    }
    else if(cArray[0] == 2) {
        cArray[1] = (Math.floor(Math.random()*10)%2);
        if(cArray[1] == 1) {
            cArray[2] = 0;
        }
        else {
            cArray[2] = 1;
        }
    }

 }


/////////////////////////////////



/* GENERATE RED COORDINATE */
function genRed()
{
    red.x = coordinate[cArray[0]][0];
    red.y = coordinate[cArray[0]][1];
}

/* GENERATE GREEN COORDINATE */
function genGreen()
{
    green.x = coordinate[cArray[1]][0];
    green.y = coordinate[cArray[1]][1];
}

/* GENERATE BLUE COORDINATE */
function genBlue()
{
    blue.x = coordinate[cArray[2]][0];
    blue.y = coordinate[cArray[2]][1];
}
