//v5.6

import QtQuick 1.0
import "rgbLogic.js" as RGB
// Copyright © 31-7-2011 Abhishek B S,Rakesh kumar R,Sadan Sohan,Sandeep Raju,Vivek P


Rectangle {
    id: rect
    width: 640
    height: 360

    Timer {
        id: timeremaining
        interval: 1000;
        running: false
        repeat: true
        onTriggered: {
            RGB.rtcount = RGB.rtcount + 1;
            RGB.c1 = RGB.rt-RGB.rtcount;
            timeScore.text = ""+RGB.c1;
            if(RGB.rtcount == RGB.rt)
            {
                RGB.rtcount = 0;
                timeremaining.running = false
                timeremaining.stop();
                jumpToPlayAreaT.running = false;
                rect.state = "finishArea1";
                yourScoreIs.text = "YOUR SCORE IS\n" + RGB.score;
                winnerTimer.running = true;
                RGB.score = 0;

            }
        }


    }

    Timer {
        id:beginningOfTime
        interval: 2000
        running: false
        onTriggered: {
            rect.state = "title"
            menuTimerT.running = true
        }
    }
    Timer {
        id:beginningOfTime2
        interval: 1000
        running: true
        onTriggered: {
            rect.state = "nokia2"
            beginningOfTime.running = true;
        }
    }


Timer{
        id: menuTimerT
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            beginningT.running = true

        }

    }

    Timer {
        id: beginningT
        interval: 100
        running: false
        repeat: false
        onTriggered: {
            rect.state = "MainMenu"
            playBoard.x = 16
            playBoard.y = 11
        }
    }



    Timer {
        id: toPlay // this is the timer to goto the playarea...
        interval: 10
        running: false
        repeat: false
        onTriggered: {
            if(RGB.playMode == 1)
            {
                rect.state = "playArea1"
                removeT.running = true
                jumpToPlayAreaT.running = true
            }
            else
            {
                rect.state = "playArea2"
                removeT.running = true
                jumpToPlayAreaT.running = true
            }

        }
    }

    Timer {
        id: removeT
        interval: 10//RGB.gameDuration
        running: false
        onTriggered: {
            start.z = 0;
            start.visible = false;
        }
    }

    Timer {
        id: winnerTimer
        interval: 3000
        running: false
        onTriggered: {
            jumpToPlayAreaT.stop();
            resume.visible = false;
            rect.state = "MainMenu8"
            resumeCard.x = 208
            playAgain.visible = true;
            RGB.score = 0;
            //RGB.timeEnd = 11;
        }
    }



    Timer {
        id: jumpToPlayAreaT
        running: false
        interval: RGB.gameDuration
        repeat: true
       triggeredOnStart: true
        onTriggered: {
            //----------------------
            //Modified date - 18/07/2011 time - 10:45 modifier - Vivek.P
            //Time Limit Code
//            RGB.timeEnd  = RGB.timeEnd - 1;
//            console.log("Remaining time" + RGB.timeEnd);
//            if(RGB.timeEnd == 0) {
//                jumpToPlayAreaT.running = false;
//                rect.state = "finishArea1";
//                yourScoreIs.text = "YOUR SCORE IS\n" + RGB.score;
//                winnerTimer.running = true;

//            }



            //--------------------------------
           RGB.count = 0;

            if(RGB.playMode == 1 ) {

                //rect.state = "playArea1"
                RGB.staticCoordGen();
                //RGB.randomCoordGen();
                RGB.assignRand();
                RGB.genRed();
                RGB.genGreen();
                RGB.genBlue();

                console.log("redx " + red.x);
                console.log("redy " + red.y);
                console.log("greenx " + green.x);
                console.log("greeny " + green.y);
                console.log("bluex " + blue.x);
                console.log("bluey " + blue.y);
                console.log("-------------***-----------")
                jumpToPlayAreaT.interval = RGB.gameDuration;
            }
            else if(RGB.playMode == 2) {
                //rect.state = "playArea2"
               // RGB.staticCoordGen();
                RGB.randomCoordGen();
                RGB.assignRand();
                RGB.genRed();
                RGB.genGreen();
                RGB.genBlue();

                console.log("redx " + red.x);
                console.log("redy " + red.y);
                console.log("greenx " + green.x);
                console.log("greeny " + green.y);
                console.log("bluex " + blue.x);
                console.log("bluey " + blue.y);
                console.log("-------------***-----------")
                jumpToPlayAreaT.interval = RGB.gameDuration;
            }



        }
    }

    Image {
        id: bg
        x: 0
        y: 0
        source: "img/bg.png"
        opacity: 0

        Image {
            id: red
            x: 49
            y: 86
            source: "img/red.png"
            opacity: 0

            Behavior on x  { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }
            Behavior on y  { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }

            MouseArea {
                id: maRed
                x: 134
                y: 104
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    console.log("red");

                    if(RGB.count == 0)
                    {
                        RGB.count = RGB.count +1;

                    }
                    else {
                        RGB.count = 1;
                        console.log("sorry try again!")
                    }
                }
            }

        }

        Image {
            id: green
            x: 317
            y: 119
            source: "img/green.png"
            opacity: 0
            Behavior on x  { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }
            Behavior on y  { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }



            MouseArea {
                id: maGreen
                x: 286
                y: 85
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    console.log("green");

                    if(RGB.count == 1)
                    {
                        RGB.count = RGB.count +1;

                    }
                    else {
                        RGB.count = 0;
                        console.log("sorry try again")
                    }
                }
            }

        }

        Image {
            id: blue
            x: 508
            y: 172
            source: "img/blue.png"
            opacity: 0
            Behavior on x  { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }
            Behavior on y  { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }

            MouseArea {
                id: maBlue
                x: 218
                y: 165
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                      console.log("blue");

                    if(RGB.count == 2)
                        {
                        RGB.count = RGB.count +1;
                        console.log("winner!!")
                        RGB.score = RGB.score + 1;
                        score.text = ""+RGB.score;
                        RGB.count = 0;
                        jumpToPlayAreaT.interval = 100;
                        //jumpToPlayAreaT.restart();

                    }
                    else {
                        RGB.count = 0;
                        console.log("sorry Try again")
                    }
                }
            }

        }
    }

    Image {
        id: header
        x: 0
        y: 0
        source: "img/header.png"
        opacity: 0

        MouseArea {
            id: maHeader
            x: 112
            y: 12
            width: 100
            height: 100
            opacity: 0
            onClicked: {
                timeremaining.stop();
                console.log("back Clicked!");
               // Qt.quit();
                jumpToPlayAreaT.stop();
                rect.state = "MainMenu8"

                resumeCard.x = 208

            }
        }

        Text {
            id: score
            x: 604
            y: 8
            width: 80
            height: 20
            text: RGB.score
            font.pixelSize: 12
            opacity: 0
        }

        Text {
            id: time
            x: 166
            y: 124
            text: "text"
            font.pixelSize: 12
            opacity: 0
        }

        Text {
            id: timeScore
            x: 166
            y: 24
            text: "text"
            font.pixelSize: 12
            opacity: 0
        }
    }


    Image {
        id: menuBg
        x: 0
        y: 0
        source: "img/menuBg.png"
        opacity: 0
    }

    states: [
        State {
              name: "nokia1"
        },
        State {
            name: "nokia2"

            PropertyChanges {
                target: firstScreen
                x: 24
                y: 153
                text: "STUDENT NOKIA DEVELOPER"
                z: 20
                font.pixelSize: 45
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }
        },
        State {
            name: "title"

            PropertyChanges {
                target: titleBg
                x: 0
                y: 0
                opacity: 1
            }

            PropertyChanges {
                target: titleRed
                x: 176
                y: 145
                opacity: 0
            }

            /*PropertyChanges {
                target: titleBlue
                x: 388
                y: 145
                visible: true
                opacity: 0
            }*/

            PropertyChanges {
                target: titleBlue
                x: 388
                y: 145
                opacity: 0
            }

            PropertyChanges {
                target: titleGreen
                opacity: 0
            }

            /*PropertyChanges {
                target: titleGrid
                x: 205
                y: 126
            }*/

            PropertyChanges {
                target: titleText
                x: 240
                y: 284
                visible: true
                opacity: 0
            }

            PropertyChanges {
                target: titleFrame
                opacity: 1
            }

            PropertyChanges {
                target: redred
                opacity: 1
            }

            PropertyChanges {
                target: greengreen
                opacity: 1
            }

            PropertyChanges {
                target: blueblue
                x: 101
                y: 0
                opacity: 1
            }

            PropertyChanges {
                target: image1
                opacity: 1
            }
        },
        State {
            name: "title1"
        },
        State {
            name: "MainMenu"

            PropertyChanges {
                target: menuBg
                z: 3
                opacity: 1
            }

            PropertyChanges {
                target: mcFlick
                width: 465
                height: 339
                opacity: 1
            }

            PropertyChanges {
                target: menuFooter
                z: 100
                opacity: 1
            }

            PropertyChanges {
                target: playButton
                x: 31
                y: 305
                z: 100
                opacity: 1
            }

            PropertyChanges {
                target: helpButton
                x: 200
                y: 304
                z: 100
                opacity: 1
            }

            PropertyChanges {
                target: aboutButton
                x: 380
                y: 304
                z: 100
                opacity: 1
            }

            PropertyChanges {
                target: exitButton
                x: 553
                y: 304
                z: 100
                opacity: 1
            }

            PropertyChanges {
                target: helpBoard
                //x: 15
                //y: 360
                z: 0
                opacity: 1
            }

            PropertyChanges {
                target: exitBoard
                //y: 360
                z: 0
                opacity: 1
            }

            PropertyChanges {
                target: aboutBoard
                //y: 360
                z: 0
                opacity: 1
            }

            PropertyChanges {
                target: playBoard
                x: 16
                y: 360
                //x: 15
                //y: 360
                z: 5
                opacity: 1
            }

            PropertyChanges {
                target: maPlay
                x: 0
                y: 0
                width: 57
                height: 55
                drag.minimumY: -10
                drag.minimumX: -10
                drag.maximumY: 10
                drag.maximumX: 10
                opacity: 1
            }

            PropertyChanges {
                target: maHelp
                x: 0
                y: 0
                width: 57
                height: 55
                opacity: 1
            }

            PropertyChanges {
                target: maAbout
                x: 0
                y: 0
                width: 57
                height: 55
                opacity: 1
            }

            PropertyChanges {
                target: maExit
                x: 0
                y: 0
                width: 57
                height: 55
                opacity: 1
            }

            PropertyChanges {
                target: playBoard
                x: 16
                y: 360
                opacity: 1
            }

            PropertyChanges {
                target: play1
                x: 188
                y: 39
                opacity: 1
            }

            PropertyChanges {
                target: play2
                opacity: 1
            }

            PropertyChanges {
                target: maPlay1
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: maPlay2
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: areusure
                opacity: 1
            }

            PropertyChanges {
                target: noexit
                x: 328
                y: 154
                opacity: 1
            }

            PropertyChanges {
                target: yesexit
                x: 48
                y: 154
                visible: true
                opacity: 1
            }

            PropertyChanges {
                target: mayes
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: mano
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }


        },
        State {
            name: "MainMenu1"

            PropertyChanges {
                target: timeScreen
                x: 0
                y: 0
                opacity: 1
            }

            PropertyChanges {
                target: min2
                x: 116
                y: 24
                width: 400
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: min5
                x: 115
                y: 136
                width: 400
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: unlimited
                x: 116
                y: 249
                width: 400
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: min2Text
                x: 136
                y: 12
                color: "#2f2e2e"
                text: "2 Minutes"
                font.pixelSize: 30
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }

            PropertyChanges {
                target: unlimitedText
                x: 137
                y: 12
                color: "#2f2e2e"
                text: "Unlimited"
                font.pixelSize: 30
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }

            PropertyChanges {
                target: min5Text
                x: 135
                y: 12
                color: "#2f2e2e"
                text: "5 minutes"
                font.pixelSize: 30
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }

            PropertyChanges {
                target: mamin2
                x: 0
                y: 0
                width: 400
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: mamin5
                x: 0
                y: 0
                width: 400
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: maunlimited
                x: 0
                y: 0
                width: 400
                height: 60
                opacity: 1
            }
        },
        State {
            name: "MainMenu2"
        },
        State {
            name: "MainMenu3"
        },
        State {
            name: "MainMenu4"
        },
        State {
            name: "MainMenu5"
        },
        State {
            name: "MainMenu6"
        },
        State {
            name: "MainMenu7"
        },
        State {
            name: "MainMenu8"

            PropertyChanges {
                target: bgresume
                opacity: 1
            }

            PropertyChanges {
                target: resumeCard
                x: 640
                y: 28
                opacity: 0.5
            }

            PropertyChanges {
                target: rgbButton
                x: 121
                y: 57
                opacity: 1
            }

            PropertyChanges {
                target: resume
                x: 90
                y: 25
                z: 0
                opacity: 1
            }

            PropertyChanges {
                target: btmm
                x: 80
                y: 122
                opacity: 1
            }

            PropertyChanges {
                target: quitresume
                x: 90
                y: 210
                opacity: 1
            }

            PropertyChanges {
                target: maresume
                x: 90
                y: 25
                width: 234
                height: 60
                anchors.rightMargin: 41
                anchors.bottomMargin: 219
                anchors.leftMargin: 90
                anchors.topMargin: 25
                opacity: 1
            }

            PropertyChanges {
                target: mabtmm
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: maquitresume
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: playAgain
                x: 90
                y: 25
                visible: false
                opacity: 1
            }

            PropertyChanges {
                target: text2
                x: 3
                y: 16
                width: 50
                color: "#2f2e2e"
                text: "RGB"
                font.pixelSize: 20
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }

            PropertyChanges {
                target: rectangle1
                x: 3
                y: 20
                width: 51
                height: 15
                opacity: 1
            }
        },
        State {
            name: "playArea1"

            PropertyChanges {
                target: bg
                opacity: 1
            }

            PropertyChanges {
                target: header
                z: 50
                opacity: 1
            }

            PropertyChanges {
                target: maHeader
                x: 0
                y: 0
                width: 72
                height: 32
                opacity: 1
            }

            PropertyChanges {
                target: score
                x: 599
                y: 3
                text: RGB.score;
                font.pixelSize: 20
                font.bold: true
                verticalAlignment: "AlignTop"
                horizontalAlignment: "AlignLeft"
                opacity: 1
            }

            PropertyChanges {
                target: red
                x: 469
                y: 376
                opacity: 1
            }

            PropertyChanges {
                target: green
                x: 564
                y: 369
                opacity: 1
            }

            PropertyChanges {
                target: blue
                x: 657
                y: 285
                opacity: 1
            }

            PropertyChanges {
                target: maRed
                x: 0
                y: 0
                width: 70
                height: 70
                drag.minimumY: -10
                drag.minimumX: -10
                drag.maximumY: 10
                drag.maximumX: 10
                opacity: 1
            }

            PropertyChanges {
                target: maGreen
                x: 0
                y: 0
                width: 70
                height: 70
                opacity: 1
            }

            PropertyChanges {
                target: maBlue
                x: 0
                y: 0
                width: 70
                height: 70
                drag.minimumY: -10
                drag.minimumX: -10
                drag.maximumY: 10
                drag.maximumX: 10
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                opacity: 1
            }

            PropertyChanges {
                target: green
                opacity: 1
            }

            PropertyChanges {
                target: start
                z: 15
                opacity: 1
            }

            PropertyChanges {
                target: time
                x: 392
                y: 1
                text: "Time:"
                font.pixelSize: 23
                opacity: 1
            }

            PropertyChanges {
                target: timeScore
                x: 467
                y: 4
                text: "0"
                font.pixelSize: 20
                font.bold: true
                opacity: 1
            }

            /*PropertyChanges {
                target: goldFrame
                x: 162
                y: 114
                z: 7
                opacity: 1
            }

            PropertyChanges {
                target: bgHoles
                z: 7
                opacity: 1
            }

            PropertyChanges {
                target: gridRed
                x: 183
                y: 156
                opacity: 1
            }

            PropertyChanges {
                target: rgrid
                x: 180
                y: -534
                spacing: 15
                z: 5
            }

            PropertyChanges {
                target: gridRed1
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed2
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed3
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed4
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed5
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed6
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed7
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed8
                opacity: 1
                z: 5
            }

            PropertyChanges {
                target: gridRed9
                opacity: 1
                z: 5
            }*/
        },
        State {
            name: "playArea2"
            PropertyChanges {
                target: bg
                opacity: "1"
            }

            PropertyChanges {
                target: header
                z: "10"
                opacity: "1"
            }

            PropertyChanges {
                target: maHeader
                x: "0"
                y: "0"
                width: "72"
                height: "32"
                opacity: "1"
            }

            PropertyChanges {
                target: score
                x: "599"
                y: "3"
                text: RGB.score;
                font.pixelSize: "20"
                font.bold: true
                horizontalAlignment: "AlignLeft"
                opacity: "1"
                verticalAlignment: "AlignTop"
            }

            PropertyChanges {
                target: red
                x: "469"
                y: "376"
                opacity: "1"
            }

            PropertyChanges {
                target: green
                x: "564"
                y: "369"
                opacity: "1"
            }

            PropertyChanges {
                target: blue
                x: "657"
                y: "285"
                opacity: "1"
            }

            PropertyChanges {
                target: maRed
                x: "0"
                y: "0"
                width: "70"
                height: "70"
                drag.minimumY: "-10"
                drag.minimumX: "-10"
                drag.maximumY: "10"
                opacity: "1"
                drag.maximumX: "10"
            }

            PropertyChanges {
                target: maGreen
                x: "0"
                y: "0"
                width: "70"
                height: "70"
                opacity: "1"
            }

            PropertyChanges {
                target: maBlue
                x: "0"
                y: "0"
                width: "70"
                height: "70"
                anchors.topMargin: "0"
                anchors.rightMargin: "0"
                anchors.bottomMargin: "0"
                anchors.leftMargin: "0"
                opacity: "1"
            }

            PropertyChanges {
                target: green
                opacity: "1"
            }

            PropertyChanges {
                target: start
                z: 15
                opacity: 1
            }

            /*PropertyChanges {
                target: goldFrame
                x: "162"
                y: "114"
                z: "7"
                opacity: "1"
            }

            PropertyChanges {
                target: bgHoles
                z: "7"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed
                x: "183"
                y: "156"
                opacity: "1"
            }

            PropertyChanges {
                target: rgrid
                x: "180"
                y: "-534"
                spacing: "15"
                z: "5"
            }

            PropertyChanges {
                target: gridRed1
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed2
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed3
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed4
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed5
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed6
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed7
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed8
                z: "5"
                opacity: "1"
            }

            PropertyChanges {
                target: gridRed9
                z: "5"
                opacity: "1"
            }*/
        },
        State {
            name: "finishArea1"

            PropertyChanges {
                target: finishArea
                opacity: 1
            }

            PropertyChanges {
                target: yourScoreIs
                x: 137
                y: 180
                color: "#ffffff"
                font.bold: true
                font.pixelSize: 50
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }
        },
        State {
            name: "quitArea"

            PropertyChanges {
                target: quitbg
                opacity: 1
            }

            PropertyChanges {
                target: quitAreYouSure
                opacity: 1
            }

            PropertyChanges {
                target: quitYes
                opacity: 1
            }

            PropertyChanges {
                target: quitNo
                x: 357
                y: 215
                opacity: 1
            }

            PropertyChanges {
                target: maQuitYes
                x: 0
                width: 234
                height: 60
                opacity: 1
            }

            PropertyChanges {
                target: maquitNo
                x: 0
                y: 0
                width: 234
                height: 60
                opacity: 1
            }
        },
        State {
            name: "MainMenu9"
        }
    ]

    Flickable {
        id: mcFlick
        x: 88
        y: 11
        width: 300
        height: 300
        opacity: 0
    }

    Image {
        id: titleBg
        x: 10
        y: 32
        source: "img/menuBg.png"
        opacity: 0

        Image {
            id: titleFrame
            x: 162
            y: 49
            source: "img/goldFrame.png"
            opacity: 0
        }

        Image {
            id: redred
            x: 182
            y: 80
            source: "img/red.png"
            opacity: 0

            Image {
                id: greengreen
                x: 104
                y: 0
                source: "img/green.png"
                opacity: 0

                Image {
                    id: blueblue
                    x: 388
                    y: 81
                    source: "img/blue.png"
                    opacity: 0
                }
            }
        }

        Image {
            id: image1
            x: 240
            y: 240
            source: "img/titleText.png"
            opacity: 0
        }
    }


        Image {
            id: titleRed
            x: 174
            y: 145
            source: "img/red.png"
            opacity: 0
            visible: false

            Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }
        }

        Image {
            id: titleBlue
            x: 272
            y: 145
            source: "img/blue.png"
            opacity: 0
            visible: false

            Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }
        }

        Image {
            id: titleGreen
            x: 280
            y: 145
            source: "img/green.png"
            opacity: 0
            visible: false

            Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutExpo; } }
        }




        Image {
        id: titleText
        x: 240
        y: 224
        source: "img/titleText.png"
        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 250; easing.type: Easing.OutElastic } }
    }


    Image {
        id: menuFooter
        x: 1
        y: 302
        source: "img/menuFooter.png"
        opacity: 0
    }








    Image {
        id: playButton
        x: 31
        y: 305
        source: "img/playButton.png"
        opacity: 0

        Behavior on y {

        }

        MouseArea {
            id: maPlay
            x: 47
            y: 10
            width: 100
            height: 100
            opacity: 0
            anchors.fill: parent
            onClicked: {
                playBoard.z = 5

                helpBoard.z = 0
                aboutBoard.z = 0
                exitBoard.z = 0

                playBoard.y = 11

                helpBoard.y = 360
                aboutBoard.y = 360
                exitBoard.y = 360

            }
        }
    }

    Image {
        id: exitButton
        x: 196
        y: 333
        source: "img/exitButton.png"
        opacity: 0

        MouseArea {
            id: maExit
            x: 539
            y: 292
            width: 100
            height: 100
            opacity: 0
            anchors.fill: parent
            onClicked: {

                exitBoard.z = 5

                helpBoard.z = 0
                aboutBoard.z = 0
                playBoard.z = 0

                exitBoard.y = 11

                helpBoard.y = 360
                aboutBoard.y = 360
                playBoard.y = 360

            }
        }
    }

    Image {
        id: helpButton
        x: 132
        y: 305
        source: "img/helpButton.png"
        opacity: 0

        MouseArea {
            id: maHelp
            x: 202
            y: 307
            width: 100
            height: 100
            opacity: 0
            anchors.fill: parent
            onClicked: {

                helpBoard.z = 5

                playBoard.z = 0
                aboutBoard.z = 0
                exitBoard.z = 0

                helpBoard.y = 11

                playBoard.y = 360
                aboutBoard.y = 360
                exitBoard.y = 360

            }
        }
    }

    Image {
        id: aboutButton
        x: 159
        y: 318
        source: "img/aboutButton.png"
        opacity: 0

        MouseArea {
            id: maAbout
            x: 378
            y: 294
            width: 100
            height: 100
            opacity: 0
            anchors.fill: parent
            onClicked: {

                aboutBoard.z = 5

                helpBoard.z = 0
                playBoard.z = 0
                exitBoard.z = 0

                aboutBoard.y = 11

                helpBoard.y = 360
                playBoard.y = 360
                exitBoard.y = 360


            }
        }
    }

    Image {
        id: helpBoard
        x: 15
        y: 360
        source: "img/helpBubble.png"
        opacity: 0

        Behavior on y {
            NumberAnimation { easing.type: Easing.InElastic; easing.period: 2.0; duration: 300 }}

        /*Text {
            id: text2
            x: 448
            y: 111
            text: "<pre align='center'>
            1.Static mode
             In this The 3 balls RGB(RED,BLUE,GREEN)
             are placed in a single row (fixed positions).
             For every fixed time interval they'll be swapped
             and you should click in the proper order before
             it is swapped again.

            2.Random mode
             In this The 3 balls positions are generated randomly.
             For every fixed time interval they'll be swapped
             and you should click in the proper order before
             it is swapped again.
            <b><i>BEST OF LUCK</i></b>
            </pre>"
            font.pixelSize: 30
            opacity: 0
        }*/


        ListView {
            id: myHelpView
            height:  parent.height
            width: parent.width
            x:0
            y:0
            model:  myHelpModel
            delegate: Text{
                text: helpText

            }
        }

        ListModel {
            id: myHelpModel
            ListElement {
                helpText: "<pre align='center'>

  The game is a relaxer. There are 2 modes in the game
   1. Static mode  2. Random mode
   In both the modes your aim should be to
                click in this order
   1st Red   2nd Green   3rd Blue
  1.Static mode
  In this The 3 balls RGB(RED,BLUE,GREEN)
  are placed in a single row (fixed positions).
  For every fixed time interval they'll be swapped
  and you should click in the proper order before
  it is swapped again.

  2.Random mode
  In this The 3 balls positions are generated randomly.
  For every fixed time interval they'll be swapped
  and you should click in the proper order before
  it is swapped again.
  <b><i>BEST OF LUCK</i></b>



                                            </pre>"
            }
        }

    }

    Image {
        id: exitBoard
        x: 15
        y: 360
        source: "img/exitBubble.png"
        opacity: 0
        Behavior on y {
            NumberAnimation { easing.type: Easing.InElastic; easing.period: 2.0; duration: 300 }}

        Image {
            id: noexit
            x: 156
            y: 157
            source: "img/noexit.png"
            opacity: 0

            MouseArea {
                id: mano
                x: 328
                y: 153
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
               onPressed: {
                   console.log("hello!")
//                   rect.state = "MainMenu"
//                   playBoard.x = 16
//                   playBoard.y = 11

                   playBoard.z = 5

                   helpBoard.z = 0
                   aboutBoard.z = 0
                   exitBoard.z = 0

                   playBoard.y = 11

                   helpBoard.y = 360
                   aboutBoard.y = 360
                   exitBoard.y = 360
               }
            }
        }

        Image {
            id: yesexit
            x: 31
            y: 481
            source: "img/yesexit.png"
            opacity: 0

            MouseArea {
                id: mayes
                x: 70
                y: 524
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
               onPressed: {
                   Qt.quit();

               }
            }
        }

        Image {
            id: areusure
            x: 71
            y: 32
            source: "img/areusure.png"
            opacity: 0
        }




    }

    Image {
        id: aboutBoard
        x: 16
        y: 360
        source: "img/aboutBubble.png"
        opacity: 0
        Behavior on y {
            NumberAnimation { easing.type: Easing.InElastic; easing.period: 2.0; duration: 300 }}

        /*Rectangle{
            id: listRect
//Put list view here

        }*/

            ListView {
                id: myListView
                height:  parent.height
                width: parent.width
                x:0
                y:0
                model:  myListModel
                delegate: Text{
                    id: text1
                    text: MyText
                    color: "white"
                    font.pixelSize: 20
                    font.family: "MV Boli"

                }
            }

            ListModel {
                id: myListModel
                ListElement {
                    MyText: "<pre align='center'>
             Developed by
               ABHISHEK B S
               RAKESH KUMAR
               SADAN SOHAN M
               SANDEEP RAJU P
               VIVEK P
                    fivemasterminds@gmail.com


                        </pre>"
                }
            }




    }

    Image {
        id: playBoard
        x: 16
        y: 360
        source: "img/playBubble.png"
        opacity: 0
        Behavior on y {
            NumberAnimation { easing.type: Easing.InElastic; easing.period: 2.0; duration: 300 }}

            Image {
                id: play1
                x: 123
                y: 31
                source: "img/play1.png"
                opacity: 0

                MouseArea {
                    id: maPlay1
                    x: 47
                    y: 6
                    width: 100
                    height: 100
                    opacity: 0
                    anchors.fill: parent
                    onClicked: {
                        RGB.playMode = 1
                        rect.state = "MainMenu1"
                        //toPlay.running = true

                    }
                }
            }

            Image {
                id: play2
                x: 188
                y: 139
                source: "img/play2.png"
                opacity: 0

                MouseArea {
                    id: maPlay2
                    x: 211
                    y: 146
                    width: 100
                    height: 100
                    opacity: 0
                    anchors.fill: parent
                    onClicked: {
                        RGB.playMode = 2
                        rect.state = "MainMenu1"
                        //toPlay.running = true

                    }
                }
            }
    }



    Image {
        id: start
        x: 0
        y: 0
        source: "img/start.png"
        opacity: 0
    }

    Image {
        id: bgresume
        x: 0
        y: 0
        source: "img/menuBg.png"
        opacity: 0

        Image {
            id: resumeCard
            x: 640
            y: 28
            source: "img/resumebubble.png"
            opacity: 0
            Behavior on x {
                NumberAnimation { easing.type: Easing.InElastic; easing.period: 2.0; duration: 300 }}

            Image {
                id: resume
                x: 706
                y: 61
                source: "img/resume.png"
                opacity: 0
            }

            Image {
                id: playAgain
                x: 731
                y: 52
                source: "img/playAgain.png"
                opacity: 0
            }

            MouseArea {
                id: maresume
                x: 737
                y: 58
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    if(resume.visible == true) {
                        timeremaining.running = true;
                        timeremaining.start();

                    //RGB.timeEnd = RGB.timeEnd + 1;
                    if(RGB.playMode == 1) {
                        jumpToPlayAreaT.start();
                        console.log(RGB.score);
                        score.text = ""+RGB.score ;
                        rect.state = "playArea1";
                    }
                    else if(RGB.playMode == 2)
                    {
                        jumpToPlayAreaT.start();
                        console.log(RGB.score);
                        score.text = ""+RGB.score ;
                        rect.state = "playArea2";
                    }

                    //jumpToPlayAreaT.running = true;


                    }
                    else if(playAgain.visible == true) {
                        timeremaining.running = true;
                        timeremaining.start();
                        playAgain.visible = false;
                        resume.visible = true;
                        //RGB.timeEnd = 11
                        if(RGB.playMode == 1) {
                            jumpToPlayAreaT.start();
                            console.log(RGB.score);
                            score.text = "0";
                            rect.state = "playArea1";
                        }
                        else if(RGB.playMode == 2)
                        {
                            jumpToPlayAreaT.start();
                            console.log(RGB.score);
                            score = RGB.score ;
                            rect.state = "playArea2";
                        }
                        jumpToPlayAreaT.restart();

                       // jumpToPlayAreaT.running = true;


                    }
                }
            }

            Image {
                id: btmm
                x: 72
                y: 123
                source: "img/btmm.png"
                opacity: 0

                MouseArea {
                    id: mabtmm
                    x: 719
                    y: 150
                    width: 100
                    height: 100
                    opacity: 0
                    anchors.fill: parent
                    onClicked: {
                        RGB.score = 0;
                        rect.state = "MainMenu";
                        playBoard.x = 16
                        playBoard.y = 11
                    }
                }
            }

            Image {
                id: quitresume
                x: 66
                y: 215
                source: "img/quitresume.png"
                opacity: 0

                MouseArea {
                    id: maquitresume
                    x: 760
                    y: 246
                    width: 100
                    height: 100
                    opacity: 0
                    anchors.fill: parent
                    onClicked: {
                        rect.state = "quitArea"
                    }
                }
            }


        }

        Image {
            id: rgbButton
            x: 91
            y: 47
            source: "img/rgbMenu.png"
            opacity: 0

            Rectangle {
                id: rectangle1
                x: 88
                y: 61
                width: 200
                height: 200
                color: "#ffffff"
                opacity: 0
            }

            Text {
                id: text2
                x: 93
                y: 59
                text: "text"
                font.pixelSize: 12
                opacity: 0
            }

        }
    }

    Image {
        id: finishArea
        x: 0
        y: 0
        source: "img/menuBg.png"
        opacity: 0

        Text {
            id: yourScoreIs
            x: 129
            y: 76
            text: "text"
            font.pixelSize: 12
            opacity: 0
        }
    }

    Image {
        id: quitbg
        x: 0
        y: 0
        source: "img/menuBg.png"
        opacity: 0

        Image {
            id: quitAreYouSure
            x: 102
            y: 57
            source: "img/areusure.png"
            opacity: 0
        }


        Image {
            id: quitYes
            x: 43
            y: 215
            source: "img/yesexit.png"
            opacity: 0

            MouseArea {
                id: maQuitYes
                x: 49
                y: 0
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    Qt.quit();
                }
            }
        }

        Image {
            id: quitNo
            x: 313
            y: 0
            source: "img/noexit.png"
            opacity: 0

            MouseArea {
                id: maquitNo
                x: 470
                y: 243
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    if(resume.visible == true) {
                        resume.visible = true
                        rect.state = "MainMenu8"
                        resumeCard.x = 208;
                    }
                    else if(playAgain.visible == true)
                            {
                            rect.state = "MainMenu8"
                            resumeCard.x = 208;
                            playAgain.visible = true

                }
                }
            }
        }
    }

    Image {
        id: timeScreen
        x: 1
        y: 0
        source: "img/start.png"
        opacity: 0

        Rectangle {
            id: min2
            x: 116
            y: 25
            width: 200
            height: 200
            color: "#ffffff"
            opacity: 0

            Text {
                id: min2Text
                x: 305
                y: 47
                text: "text"
                font.pixelSize: 12
                opacity: 0
            }

            MouseArea {
                id: mamin2
                x: 116
                y: 25
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    RGB.rt = 120



                    toPlay.running = true

                    timeremaining.running = true
                }
            }
        }

        Rectangle {
            id: min5
            x: 115
            y: 123
            width: 200
            height: 200
            color: "#ffffff"
            opacity: 0

            Text {
                id: min5Text
                x: 307
                y: 271
                text: "text"
                font.pixelSize: 12
                opacity: 0
            }

            MouseArea {
                id: mamin5
                x: 132
                y: 138
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    RGB.rt = 300


                    toPlay.running = true
                     timeremaining.running = true
                }
            }
        }

        Rectangle {
            id: unlimited
            x: 116
            y: 227
            width: 200
            height: 200
            color: "#ffffff"
            opacity: 0

            Text {
                id: unlimitedText
                x: 305
                y: 159
                text: "text"
                font.pixelSize: 12
                opacity: 0
            }

            MouseArea {
                id: maunlimited
                x: 144
                y: 260
                width: 100
                height: 100
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    //RGB.rt = 99999999999

                    //RGB.timeEnd = 9999999999
                    toPlay.running = true


                }
            }
        }

    }

    Text {
        id: firstScreen
        x: 132
        y: 64
        text: "text"
        font.pixelSize: 12
        opacity: 0
    }

}
