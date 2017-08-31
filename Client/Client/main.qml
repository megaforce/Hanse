import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import trade.backend 1.0


/************************************************************************************************************************
*                                           Megaforce Graphic engine V.1                                                *
*                                           Welcome to my graphic engine!                                               *
*                                           God help anyone                                                             *
*                                           trying to read this...                                                      *
*                                                                -Majtaz                                                *
*                                                                                                                       *
************************************************************************************************************************/

Window {
    id: root;
    BackEnd {
        id: backend;
    }
    width: 1440;
    height: 900;
    visible: true;
    Map{
        id: main_menu;
        width: parent.width;
        height: parent.height;
        color: "Black";
        Button{
            id: start_game;
            anchors.centerIn: parent;
            text: "START GAME";
            onClicked: {
                login.visible = true;
            }
        }
        Login_form{
            visible: false;
            color: "red";
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
        anchors.centerIn: parent;
        color: "blue";
        Resource_Form{
            id: resources;
            anchors.bottom: main_map.bottom;
            anchors.left: island_4.right;
            anchors.margins: 10;
        }
        Trade_Form{
            id: trade_form;
            visible: false;
            anchors.centerIn: main_map;
        }
        Client_Trade_Form{
            id: client_trade_form;
            visible: false;
            anchors.centerIn: main_map;
        }

        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island1.png";
            width: main_map.width / 7.11;
            height: main_map.height / 4;
            Boat{
                id: boat_1;
                anchors.right: island_1.right;
                anchors.top: island_1.bottom;
            }
            id: island_1;
            anchors.left: parent.left;
            anchors.top: parent.top;
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_1.visible = true;
                }
            }
            Trade_Menu{
                id: trade_menu_1;
                anchors.left: parent.right;
                Button{
                    id: trade_button_1;
                    text: "TRADE";
                    anchors.bottomMargin: 5;
                    MouseArea {
                        anchors.fill: trade_button_1;
                        onClicked: {
                            boat_1.visible = true;
                            trade_form.visible = true;
                            trade_form.enabled = true;
                            trade_menu_1.visible = false;
                            backend.setTradePartner(0);
                        }
                    }
                }
                Button{
                    anchors.top: trade_button_1.bottom;
                    anchors.left: trade_button_1.left;
                    id: cancel_button_1;
                    text: "CANCEL";
                    MouseArea {
                        anchors.fill: cancel_button_1;
                        onClicked: {
                            trade_form.visible = false;
                            trade_form.enabled = false;
                            trade_menu_1.visible = false;
                        }
                    }
                }
            }
        }
        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island2.png";
            width: main_map.width / 7.11;
            height: main_map.height / 4;
            Boat{
                id: boat_2;
                anchors.left: parent.left;
                anchors.top: island_2.bottom;
            }
            id: island_2;
            anchors.right: parent.right;
            anchors.top: parent.top;
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_2.visible = true;
                }
                Trade_Menu{
                    id: trade_menu_2;
                    anchors.left: parent.right;
                    Button{
                        id: trade_button_2;
                        text: "TRADE";
                        anchors.bottomMargin: 5;
                        MouseArea {
                            anchors.fill: trade_button_2;
                            onClicked: {
                                boat_2.visible = true;
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
                            }
                        }
                    }
                }
            }
        }
        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island3.png";
            width: main_map.width / 7.11;
            height: main_map.height / 4;
            Boat{
                id: boat_3;
                anchors.left: parent.left;
                anchors.bottom: parent.top;
            }
            id: island_3;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_3.visible = true;
                }
                Trade_Menu{
                    id: trade_menu_3;
                    anchors.left: parent.right;
                    Button{
                        id: trade_button_3;
                        text: "TRADE";
                        anchors.bottomMargin: 5;
                        MouseArea {
                            anchors.fill: trade_button_3;
                            onClicked: {
                                boat_3.visible = true;
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
                            }
                        }
                    }
                }
            }
        }
        Island{
            fillMode: Image.PreserveAspectFit;
            source: "/File/image/island4.png";
            width: main_map.width / 7.11;
            height: main_map.height / 4;
            Boat{
                id: boat_4;
                anchors.right: parent.right;
                anchors.bottom: parent.top;
            }
            id: island_4;
            anchors.left: parent.left;
            anchors.bottom: parent.bottom;
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    trade_menu_4.visible = true;
                }
                Trade_Menu{
                    id: trade_menu_4;
                    anchors.left: parent.right;

                    Button{
                        id: trade_button_4;
                        text: "TRADE";
                        anchors.bottomMargin: 5;
                        MouseArea {
                            anchors.fill: trade_button_4;
                            onClicked: {
                                boat_4.visible = true;
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
                            }
                        }
                    }
                }
            }
        }
    }
}
