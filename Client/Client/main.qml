import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import trade.backend 1.0


/************************************************************************************************************************
*                                           Megaforce Graphic engine V.1.114                                            *
*                                           Welcome to my graphic engine!                                               *
*                                           God help anyone                                                             *
*                                           trying to read this...                                                      *
*                                                                -Majtaz                                                *
*                                                                                                                       *
************************************************************************************************************************/


/************************************************************************************************************************
*                                           My will to live                                                             *
*                                           doesn't exist                                                               *
*                                           anymore                                                                     *
*                                                                -Majtaz                                                *
*                                                                                                                       *
************************************************************************************************************************/


Window {
    id: root;
    BackEnd {
        id: backend;
    }


    function refreshUserNames() {
        player_1_name.text = backend.getPlayer(0);
        player_2_name.text = backend.getPlayer(1);
        player_3_name.text = backend.getPlayer(2);
        player_4_name.text = backend.getPlayer(3);
    }
    function display_ptfb()
    {
        display_pt.visible = true;
    }
    function winner(player_w)
    {
        end_game_text.text = player_w + " HAS WON! CONGRATULATIONS";
        endgame.visible = true;
        main_map.visible=false;
    }
    function timer_inc()
    {
        timer_text.text = (Number(timer_text.text) + 59) % 60;
    }
    function reset_timer()
    {
        timer_text.text = '60';
    }

    width: 1440;
    height: 900;
    visible: true;
    Map{
        id:endgame
        width: parent.width;
        source: "/File/image/background.png";
        height: parent.height;
        visible: false
        End_Game{
                anchors.centerIn: parent

            TextField{
                id: end_game_text

                visible: true
                anchors.centerIn: parent
                text: " HAS WON! CONGRATULATIONS"

            }
        }
    }
    Map{

        id: main_menu;
        width: parent.width;
        source: "/File/image/background.png";
        height: parent.height;
        Button{
            id: start_game;
            anchors.centerIn: parent;
            anchors.bottomMargin: 10;
            text: "START GAME";
            onClicked: {
                login.visible = true;
                exit_game.visible=false;
            }
        }
        Button{
            id: exit_game;
            anchors.left: start_game.left
            anchors.topMargin: 10;
            anchors.top: start_game.bottom
            text: "EXIT GAME";
            onClicked: {
                root.close();
            }
        }
        Login_form{
            visible: false;
            id: login;
            anchors.centerIn: parent;
            Item{
                anchors.centerIn: parent;
                TextField{
                    id: username;
                    anchors.centerIn: parent;
                    anchors.top: parent.top;
                    selectByMouse: true;
                    anchors.margins: 10;
                    color: "Green";
                    text: "";
                    placeholderText: qsTr("Enter username");
                    opacity: 1000;
                }
                Button{

                    id: connect;
                    text: "CONNECT";
                    anchors.top: username.bottom;
                    anchors.left: username.left;
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            backend.startGame(username.text);
                            main_menu.visible = false;
                            main_menu.enabled = false;
                            main_map.visible = true;
                        }
                    }
                }
            }
        }
    }

    Map{
        visible: false;
        id: main_map;
        width: parent.width;
        height: parent.height;
        source: "/File/image/Sea.png";
        Button{
            id: display_pt
            visible: false;
            anchors.centerIn: parent;
            text: "NEW TRADE"
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    pending_trade_form.visible = true
                    display_pt.visible = false
                }
            }
        }
        Round_Timer{
            id: turns;
            fillMode: Image.PreserveAspectFit;
            anchors.left: resources.right
            anchors.top: resources.top
            anchors.bottomMargin: 100;
            anchors.leftMargin: 30;
            width: parent.width;
            height: parent.height
            Item{
                width: parent.width;
                height: parent.height
                TextField
                {
                    width: parent.width/12
                    anchors.left: turns.right
                    anchors.top: turns.top
                    readOnly: true
                    id:timer_text_left;
                    text:"TIME LEFT:"
                }
                TextField
                {
                    width: parent.width/12
                    anchors.top: timer_text_left.bottom
                    anchors.left: timer_text_left.left
                    anchors.bottomMargin: 10
                    readOnly: true
                    id:timer_text;
                    text:"20"
                }
            }
        }
        Resource_Form{
            id: resources;
            fillMode: Image.PreserveAspectFit
            anchors.bottom: main_map.bottom;
            anchors.left: island_4.right;
            anchors.margins: 10;
            anchors.leftMargin: 200;
        }
        Trade_Form{
            id: trade_form;
            fillMode: Image.PreserveAspectFit
            visible: false;
            anchors.centerIn: main_map;
        }
        Pending_Trade_Form{
            fillMode: Image.PreserveAspectFit;
            id: pending_trade_form
            visible: false
            anchors.centerIn: main_map
        }

        Island{

            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island1.png";
            width: main_map.width / 5;
            height: main_map.height / 4;
            Boat{
                id: boat_1;
                visible: false
                anchors.right: island_1.right;
                anchors.top: island_1.bottom;
            }
            id: island_1;
            anchors.left: parent.left;
            anchors.top: parent.top;
            TextField{
                id: player_1_name
                text: backend.getPlayer(0);
                readOnly: true
                anchors.left: island_1.left
                anchors.top: island_1.top
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_1.visible = true;
                }
            }
            Trade_Menu{
                id: trade_menu_1;
                anchors.centerIn: island_1
                Button{
                    id: trade_button_1;
                    text: "TRADE";
                    anchors.bottomMargin: 5;
                    MouseArea {
                        anchors.fill: trade_button_1;
                        onClicked: {

                            trade_form.visible = true;
                            trade_form.enabled = true;
                            trade_menu_1.visible = false;
                            backend.setTradePartner(0);
                        }
                    }
                }

                Button{
                    anchors.top: trade_button_1.bottom;
                    anchors.left:trade_button_1.left;
                    id: cancel_button_1;
                    text: "CANCEL";
                    MouseArea {
                        anchors.fill: cancel_button_1;
                        onClicked: {
                            trade_form.visible = false;
                            trade_form.enabled = false;
                            trade_menu_1.visible = false;
                            pending_trade_form.visible = false
                        }
                    }
                }
                /*Button{
                    anchors.top: trade_button_1.bottom;
                    anchors.left: trade_button_1.left;
                    id: pending_trade_button_1;
                    text: "OPEN TRADES";
                    MouseArea {
                        anchors.fill: pending_trade_button_1;
                        onClicked: {
                            pending_trade_form.visible = true
                        }
                    }
                }*/
            }
        }
        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island2.png";
            width: main_map.width / 5;
            height: main_map.height / 4;
            Boat{
                id: boat_2;
                visible: false
                anchors.left: parent.left;
                anchors.top: island_2.bottom;
            }
            id: island_2;
            anchors.right: parent.right;
            anchors.top: parent.top;
            TextField{
                id: player_2_name
                text: backend.getPlayer(1);
                readOnly: true
                anchors.left: island_2.left
                anchors.top: island_2.top
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_2.visible = true;
                }
                Trade_Menu{
                    id: trade_menu_2;
                    anchors.centerIn: parent
                    Button{
                        id: trade_button_2;
                        text: "TRADE";
                        anchors.bottomMargin: 5;
                        MouseArea {
                            anchors.fill: trade_button_2;
                            onClicked: {

                                trade_form.visible = true;
                                trade_form.enabled = true;
                                trade_menu_2.visible = false;
                                backend.setTradePartner(1);
                            }
                        }
                    }
                    Button{
                        anchors.top: trade_button_2.bottom;
                        anchors.left: trade_button_2.left;
                        id: cancel_button_2;
                        text: "CANCEL";
                        MouseArea {
                            anchors.fill: cancel_button_2;
                            onClicked: {
                                trade_form.visible = false;
                                trade_form.enabled = false;
                                trade_menu_2.visible = false;
                                pending_trade_form.visible = false
                            }
                        }


                    }
                 /*   Button{
                        anchors.top: trade_button_2.bottom;
                        anchors.left: trade_button_2.left;
                        id: pending_trade_button_2;
                        text: "OPEN TRADES";
                        MouseArea {
                            anchors.fill: pending_trade_button_2;
                            onClicked: {
                                pending_trade_form.visible = true
                            }
                        }
                    }*/
                }
            }
        }
        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island3.png";
            width: main_map.width / 5;
            height: main_map.height / 4;
            Boat{
                visible: false
                id: boat_3;
                anchors.left: parent.left;
                anchors.bottom: parent.top;
            }
            id: island_3;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            TextField{
                id: player_3_name
                text: backend.getPlayer(2);
                readOnly: true
                anchors.left: island_3.left
                anchors.top: island_3.top
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_3.visible = true;
                }
                Trade_Menu{
                    id: trade_menu_3;
                    anchors.centerIn: parent
                    Button{
                        id: trade_button_3;
                        text: "TRADE";
                        anchors.bottomMargin: 5;
                        MouseArea {
                            anchors.fill: trade_button_3;
                            onClicked: {

                                trade_form.visible = true;
                                trade_form.enabled = true;
                                trade_menu_3.visible = false;
                                backend.setTradePartner(2);
                            }
                        }
                    }
                    Button{
                        anchors.top: trade_button_3.bottom;
                        anchors.left: trade_button_3.left;
                        id: cancel_button_3;
                        text: "CANCEL";
                        MouseArea {
                            anchors.fill: cancel_button_3;
                            onClicked: {
                                trade_form.visible = false;
                                trade_form.enabled = false;
                                trade_menu_3.visible = false;
                                pending_trade_form.visible = false
                            }
                        }
                    }
              /*    Button{
                        anchors.top: trade_button_3.bottom;
                        anchors.left: trade_button_3.left;
                        id: pending_trade_button_3;
                        text: "OPEN TRADES";
                        MouseArea {
                            anchors.fill: pending_trade_button_3;
                            onClicked: {
                                pending_trade_form.visible = true
                            }
                        }
                    }*/
                }
            }
        }
        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island4.png";
            width: main_map.width / 5;
            height: main_map.height / 4;
            Boat{
                visible: false
                id: boat_4;
                anchors.right: parent.right;
                anchors.bottom: parent.top;
            }
            id: island_4;
            anchors.left: parent.left;
            anchors.bottom: parent.bottom;
            TextField{
                id: player_4_name
                text: backend.getPlayer(3);
                readOnly: true
                anchors.left: island_4.left
                anchors.top: island_4.top
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_4.visible = true;
                }
                Trade_Menu{
                    id: trade_menu_4;
                    anchors.centerIn: parent

                    Button{
                        id: trade_button_4;
                        text: "TRADE";
                        anchors.bottomMargin: 5;
                        MouseArea {
                            anchors.fill: trade_button_4;
                            onClicked: {

                                trade_form.visible = true;
                                trade_form.enabled = true;
                                trade_menu_4.visible = false;
                                backend.setTradePartner(3);
                            }
                        }
                    }
                    Button{
                        anchors.top: trade_button_4.bottom;
                        anchors.left: trade_button_4.left;
                        id: cancel_button_4;
                        text: "CANCEL";
                        MouseArea {
                            anchors.fill: cancel_button_4;
                            onClicked: {
                                trade_form.visible = false;
                                trade_form.enabled = false;
                                trade_menu_4.visible = false;
                                pending_trade_form.visible = false
                            }
                        }

                    }
                 /*   Button{
                        anchors.top: trade_button_4.bottom;
                        anchors.left: trade_button_4.left;
                        id: pending_trade_button_4;
                        text: "OPEN TRADES";
                        MouseArea {
                            anchors.fill: pending_trade_button_4;
                            onClicked: {
                                pending_trade_form.visible = true
                            }
                        }
                    }*/
                }
            }
        }
    }
}
