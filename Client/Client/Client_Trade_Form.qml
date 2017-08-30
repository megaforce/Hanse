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
// a code? A CODE? what is this india?
//                                  -Muf

Rectangle{
    height: 320
    width: 850
    visible: false
    enabled: false
    color: "Black"
    Item {
        TextField{
            id: blank
            visible: false
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
            enabled: false
            anchors.left: parent.left
            anchors.top: parent.top
            color: "black"
        }
        TextField
        {
            id: stone
            enabled: false
            text: "Stone"
            anchors.topMargin: 10
            anchors.right: blank.right
            anchors.top: blank.bottom
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: iron
            text: "Iron"
            enabled: false
            anchors.top: stone.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: wood
            text: "Wood"
            enabled: false
            anchors.top: iron.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: food
            text: "Food"
            enabled: false
            anchors.top: wood.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: player_offer
            text: "Player offer"
            enabled: false
            anchors.left: blank.right
            anchors.top: blank.top
            anchors.margins: 10
            anchors.topMargin: 0
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: stone_client_offer
            text:""
            enabled: false
            anchors.left: stone.right
            anchors.top: stone.top
            anchors.margins: 10
            anchors.topMargin: 0
            color: "Green"
            opacity: 1000

        }
        TextField{
            id: iron_client_offer
            text:""
            enabled: false
            anchors.left: iron.right
            anchors.top: stone_client_offer.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: wood_client_offer
            text:""
            enabled: false
            anchors.left: wood.right
            anchors.top: iron_client_offer.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: food_client_offer
            text:""
            enabled: false
            anchors.left: food.right
            anchors.top: wood_client_offer.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: player_demand
            text: "Player demand"
            enabled: false
            anchors.left: player_offer.right
            anchors.top: player_offer.top
            anchors.margins: 10
            anchors.topMargin: 0
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: stone_client_demand
            text:""
            enabled: false
            anchors.left: stone_client_offer.right
            anchors.top: stone_client_offer.top
            anchors.margins: 10
            anchors.topMargin: 0
            color: "Green"
            opacity: 1000

        }
        TextField{
            id: iron_client_demand
            text:""
            enabled: false
            anchors.left: iron_client_offer.right
            anchors.top: stone_client_demand.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: wood_client_demand
            text:""
            enabled: false
            anchors.left: wood_client_offer.right
            anchors.top: iron_client_demand.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
        }
        TextField{
            id: food_client_demand
            text:""
            enabled: false
            anchors.left: food_client_offer.right
            anchors.top: wood_client_demand.bottom
            anchors.margins: 10
            color: "Green"
            opacity: 1000
        }
        Button{
            id: client_trade
            text: "TRADE"
            anchors.left: food_client_demand.left
            anchors.top: food_client_demand.bottom
            anchors.margins: 10
            anchors.leftMargin: 0
            MouseArea {

            }
        }
        Button{
            id: client_decline
            text: "DECLINE"
            anchors.left: food_client_offer.left
            anchors.top: food_client_offer.bottom
            anchors.margins: 10
            anchors.leftMargin: 0
            MouseArea {

            }
        }
    }
}
