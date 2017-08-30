import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import trade.backend 1.0


/************************************************************************************************************************
*                                                   I have never thought                                                *
*                                                   I'd live to see the day,                                            *
*                                                   when my code looks so bad                                           *
*                                                   it makes me cry.                                                    *
*                                                                        -Matjaz                                        *
*                                                                                                                       *
************************************************************************************************************************/


Rectangle{
    height: 320
    width: 850
    visible: false
    enabled: false
    color: "Black"
    BackEnd {
        id: backend
    }
    Item {

        TextField
        {
            id: stone
            //width: 100
            readOnly: true
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
            readOnly: true
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
            readOnly: true
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
            readOnly: true
            anchors.top: wood.bottom
            anchors.margins: 10
            anchors.left: parent.left
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: stone_sent
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: offer.left
            anchors.top: offer.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("stoneOffered", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: iron_sent
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: stone_sent.left
            anchors.top: stone_sent.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("ironOffered", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: wood_sent
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: iron_sent.left
            anchors.top: iron_sent.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("woodOffered", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: food_sent
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: wood_sent.left
            anchors.top: wood_sent.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("foodOffered", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: stone_requested
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: request.left
            anchors.top: request.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("stoneRequested", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: iron_requested
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: stone_requested.left
            anchors.top: stone_requested.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("ironRequested", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: wood_requested
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: iron_requested.left
            anchors.top: iron_requested.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("woodRequested", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: food_requested
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: wood_requested.left
            anchors.top: wood_requested.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("foodRequested", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: stone_resource
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: resource.left
            anchors.top: resource.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("stoneGiven", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: iron_resource
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: stone_resource.left
            anchors.top: stone_resource.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("ironGiven", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: wood_resource
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: iron_resource.left
            anchors.top: iron_resource.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("woodGiven", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: food_resource
            anchors.margins: 10
            anchors.leftMargin: 0
            anchors.left: wood_resource.left
            anchors.top: wood_resource.bottom
            validator: IntValidator{
                bottom: 0;
                top: 999999;
            }
            selectByMouse: true;
            onTextChanged: backend.setTradeProperty("foodGiven", text)
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: blank
            visible: false
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
            enabled: false
            anchors.left: parent.left
            anchors.top: parent.top
        }
        TextField
        {
            id: offer
            text: "Your offer"
            readOnly: true
            anchors.margins: 10
            anchors.left: blank.right
            anchors.top: parent.top
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: request
            text: "Your request"
            readOnly: true
            anchors.margins: 10
            anchors.left: offer.right
            anchors.top: parent.top
            color: "Green"
            opacity: 1000
        }
        TextField
        {
            id: resource
            text: "Acctual resources"
            readOnly: true
            anchors.margins: 10
            anchors.left: request.right
            anchors.top: parent.top
            color: "Green"
            opacity: 1000
        }
        Button{
            id: clear
            text: "CLEAR"
            anchors.left: food_requested.left
            anchors.top: food_requested.bottom
            anchors.margins: 10
            MouseArea {
                anchors.fill: clear
                onClicked: {
                    backend.clearTrade();
                    stone_sent.clear();
                    food_sent.clear();
                    iron_sent.clear();
                    wood_sent.clear();
                    stone_requested.clear();
                    food_requested.clear();
                    iron_requested.clear();
                    wood_requested.clear();
                    stone_resource.clear();
                    iron_resource.clear();
                    wood_resource.clear();
                    food_resource.clear();
                }
            }

        }
        Button{
            id: send
            text: "TRADE"
            anchors.left: food_resource.left
            anchors.top: food_resource.bottom
            anchors.margins: 10

            MouseArea {
                anchors.fill: send
                onClicked: {
                    backend.sendTrade()
                }
            }
        }
    }
}
