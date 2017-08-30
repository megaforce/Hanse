import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import trade.backend 1.0


/************************************************************************************************************************
*                                                   If I ever have to work                                              *
*                                                   on a code as bad as this                                            *
*                                                   I'm going to do something                                           *
*                                                   drastic.........                                                    *
*                                                                        -Matjaz                                        *
*                                                                                                                       *
************************************************************************************************************************/
// a code? A CODE? what is this a india?
//                                   -Muf

Rectangle{
    height: 320
    width: 850

    enabled: true
    color: "Black"
    Item {
        TextField{
            id: blank
            visible: false
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
            enabled: true
            anchors.left: parent.left
            anchors.top: parent.top
            color: "black"
        }
        TextField
        {
            id: stone
            enabled: true
            text: "Stone"
            anchors.topMargin: 10
            anchors.right: blank.right
            anchors.top: blank.bottom
            color: "Green"
            opacity: 1000
            readOnly: true
        }
        TextField
        {
            id: iron
            text: "Iron"
            enabled: true
            anchors.top: stone.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
            readOnly: true
        }
        TextField
        {
            id: wood
            text: "Wood"
            enabled: true
            anchors.top: iron.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
            readOnly: true
        }
        TextField
        {
            id: food
            text: "Food"
            enabled: true
            anchors.top: wood.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
            readOnly: true
        }
        TextField{
        id: player_offer
        text: "Player offer"
        enabled: true
        anchors.left: blank.right
        anchors.top: blank.top
        anchors.margins: 10
        anchors.topMargin: 0
        color: "Green"
        opacity: 1000
        readOnly: true
        }
        TextField{
        id: stone_client_offer
        text:""
        enabled: true
        anchors.left: stone.right
        anchors.top: stone.top
        anchors.margins: 10
        anchors.topMargin: 0
        color: "Green"
        opacity: 1000
        readOnly: true
        }
        TextField{
        id: iron_client_offer
        text:""
        enabled: true
        anchors.left: iron.right
        anchors.top: stone_client_offer.bottom
        anchors.margins: 10
        color: "Green"
        opacity: 1000
        readOnly: true
        }
        TextField{
        id: wood_client_offer
        text:""
        enabled: true
        anchors.left: wood.right
        anchors.top: iron_client_offer.bottom
        anchors.margins: 10
        color: "Green"
        opacity: 1000
        readOnly: true
        }
        TextField{
        id: food_client_offer
        text:""
        enabled: true
        anchors.left: food.right
        anchors.top: wood_client_offer.bottom
        anchors.margins: 10
        color: "Green"
        opacity: 1000
        readOnly: true
        }
        TextField{
            id: player_demand
            text: "Player demand"
            enabled: true
            anchors.left: player_offer.right
            anchors.top: player_offer.top
            anchors.margins: 10
            anchors.topMargin: 0
            color: "Green"
            opacity: 1000
            readOnly: true
            }
            TextField{
            id: stone_client_demand
            text:""
            enabled: true
            anchors.left: stone_client_offer.right
            anchors.top: stone_client_offer.top
            anchors.margins: 10
            anchors.topMargin: 0
            color: "Green"
            opacity: 1000
            readOnly: true
            }
            TextField{
            id: iron_client_demand
            text:""
            enabled: true
            anchors.left: iron_client_offer.right
            anchors.top: stone_client_demand.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
            readOnly: true
            }
            TextField{
            id: wood_client_demand
            text:""
            enabled: true
            anchors.left: wood_client_offer.right
            anchors.top: iron_client_demand.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
            readOnly: true
            }
            TextField{
            id: food_client_demand
            text:""
            enabled: true
            anchors.left: food_client_offer.right
            anchors.top: wood_client_demand.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
            readOnly: true
            }
            TextField
            {
                id: acctual
                enabled: true
                text: "Acctual resources"
                anchors.margins: 10
                anchors.topMargin: 0
                anchors.left: player_demand.right
                anchors.top: player_demand.top
                color: "Green"
                opacity: 1000
                readOnly: true

            }
            TextField
            {
                id: send_stone
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: acctual.left
                anchors.top:  acctual.bottom
                validator: IntValidator{
                    bottom: 0;
                    top: 999999;
                }
                selectByMouse: true;
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: send_iron
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: send_stone.left
                anchors.top: send_stone.bottom
                validator: IntValidator{
                    bottom: 0;
                    top: 999999;
                }
                selectByMouse: true;
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: send_wood
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: send_iron.left
                anchors.top: send_iron.bottom
                validator: IntValidator{
                    bottom: 0;
                    top: 999999;
                }
                selectByMouse: true;
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: send_food
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: send_wood.left
                anchors.top: send_wood.bottom
                validator: IntValidator{
                    bottom: 0;
                    top: 999999;
                }
                selectByMouse: true;
                color: "Green"
                opacity: 1000
            }
        Button{
            id: client_trade
            text: "TRADE"
            anchors.left: send_food.left
            anchors.top: send_food.bottom
            anchors.margins: 10
            anchors.leftMargin: 0
            MouseArea {

            }
        }
        Button{
            id: client_decline
            text: "DECLINE"
            anchors.left: food_client_demand.left
            anchors.top: food_client_demand.bottom
            anchors.margins: 10
            anchors.leftMargin: 0
            MouseArea {

            }
        }
    }
}
