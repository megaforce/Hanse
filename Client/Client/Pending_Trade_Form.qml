import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import trade.backend 1.0

//TODO needs a fetch called when the menu opens;

Image{
    height: parent.height /3.5
    width: parent.width /2
    Rectangle{
        height: parent.height
        width: parent.width

        enabled: true
        color: "Black"
        Item {
            height: parent.height
            width: parent.width
            id: ptf
            function fetch() {
                stone_client_offer.text = backend.tradeInfo("stone_client_offer");
                iron_client_offer.text = backend.tradeInfo("iron_client_offer");
                wood_client_offer.text = backend.tradeInfo("wood_client_offer");
                food_client_offer.text = backend.tradeInfo("food_client_offer");
                stone_client_demand.text = backend.tradeInfo("stone_client_demand");
                iron_client_demand.text = backend.tradeInfo("iron_client_demand");
                wood_client_demand.text = backend.tradeInfo("wood_client_demand");
                food_client_demand.text = backend.tradeInfo("food_client_demand");
            }

            TextField{
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: acctual.left
                anchors.top:  acctual.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: send_iron
                height: ptf.height /8.2
                width: ptf.width /4.3
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: send_stone.left
                anchors.top: send_stone.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: send_wood
                height: ptf.height /8.2
                width: ptf.width /4.3
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: send_iron.left
                anchors.top: send_iron.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: send_food
                height: ptf.height /8.2
                width: ptf.width /4.3
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: send_wood.left
                anchors.top: send_wood.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                color: "Green"
                opacity: 1000
            }
            Button{
                id: client_trade
                height: ptf.height /8.2
                width: ptf.width /4.3
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
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: "DECLINE"
                anchors.left: food_client_demand.left
                anchors.top: food_client_demand.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                //anchors.topMargin: 0
                MouseArea {

                }
            }
            Button{
                id: previous_trade
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: "PREVIOUS TRADE"
                anchors.left: food.left
                anchors.top: food.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                //anchors.topMargin: 0
                MouseArea {
                    anchors.fill: previous_trade;
                    onClicked: {
                        backend.tradeInfo("prev");
                        ptf.fetch();
                    }
                }
            }
            Button{
                id: next_trade
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: "NEXT TRADE"
                anchors.left: food_client_offer.left
                anchors.top: food_client_offer.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                MouseArea {
                    anchors.fill: next_trade;
                    onClicked: {
                        backend.tradeInfo("next");
                        ptf.fetch();
                    }
                }
            }
        }
    }
}
