import QtQuick 2.7
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

/************************************************************************************************************************
 *                                                   a code? A CODE?                                                     *
 *                                                   what is this a india?                                               *
 *                                                                        -Muf                                           *
 *                                                                                                                       *
 ************************************************************************************************************************/

Image{
    id: ptfq
    height: parent.height /3
    width: parent.width /1.5
    Rectangle{
        height: parent.height
        width: parent.width
        TextField{
            height: ptf.height/8.2
            width: ptf.width
            text : "YOU ARE TRADING WITH : "
            id: from
            enabled: true
            color: "Green"
            opacity: 1000
            readOnly: true
            anchors.bottom: parent.top
            anchors.left: parent.left
        }
        enabled: true
        color: "Black"
        Item {
            height: parent.height
            width: parent.width/1.5
            anchors.right: parent.right
            id: ptf
            function clean() {
                from.clear();
                stone_client_offer.clear();
                iron_client_offer.clear();
                wood_client_offer.clear();
                food_client_offer.clear();
                stone_client_demand.clear();
                iron_client_demand.clear();
                wood_client_demand.clear();
                food_client_demand.clear();
            }
            function fetch() {
                from.text = "YOU ARE TRADING WITH : " + backend.tradeInfo("from") ;
                stone_client_offer.text = backend.tradeInfo("stone_client_offer");
                iron_client_offer.text = backend.tradeInfo("iron_client_offer");
                wood_client_offer.text = backend.tradeInfo("wood_client_offer");
                food_client_offer.text = backend.tradeInfo("food_client_offer");
                stone_client_demand.text = backend.tradeInfo("stone_client_demand");
                iron_client_demand.text = backend.tradeInfo("iron_client_demand");
                wood_client_demand.text = backend.tradeInfo("wood_client_demand");
                food_client_demand.text = backend.tradeInfo("food_client_demand");
            }
            function check_resources(){
                var food = Number(send_food.text);
                var wood = Number(send_wood.text);
                var stone = Number(send_stone.text);
                var iron = Number(send_iron.text);

                var back_food = Number(backend.foodRes);
                var back_wood = Number(backend.woodRes);
                var back_stone = Number(backend.stoneRes);
                var back_iron = Number(backend.ironRes);

                if (back_food < food || food < 0)
                {
                    send_food.text="0";
                }
                if (back_wood < wood || wood < 0)
                {
                    send_wood.text="0";
                }
                if (back_stone < stone || stone < 0)
                {
                    send_stone.text="0";
                }
                if (back_iron < iron || iron < 0)
                {
                    send_iron.text="0";
                }
            }

            TextField{
                height: ptf.height /8.2
                width: ptf.width /4.3
                id: blank
                anchors.leftMargin: 10
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                enabled: true
                visible: false
                anchors.right: acctual.left
                anchors.top: ptf.top
                color: "Green"
                opacity: 1000
                readOnly: true
            }
            TextField
            {
                id: stone
                height: ptf.height /8.2
                width: ptf.width /4.3
                enabled: true
                text: "Stone"
                anchors.rightMargin:10
                anchors.leftMargin: 10
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
                anchors.topMargin: 10
                anchors.rightMargin:10
                anchors.leftMargin: 10
                anchors.right: blank.right
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
                anchors.topMargin: 10
                anchors.rightMargin:10
                anchors.leftMargin: 10
                anchors.right: blank.right
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
                anchors.topMargin: 10
                anchors.rightMargin:10
                anchors.leftMargin: 10
                anchors.right: blank.right
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
                anchors.right: player_demand.left
                anchors.top: ptf.top
                anchors.margins: 10
                anchors.topMargin: 10
                anchors.leftMargin: 0
                anchors.rightMargin: 10
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
                anchors.left: player_offer.left
                anchors.top: player_offer.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.topMargin: 10
                anchors.rightMargin: 20
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
                anchors.left: player_offer.left
                anchors.top: stone_client_offer.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.rightMargin: 20
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
                anchors.left: player_offer.left
                anchors.top: iron_client_offer.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.rightMargin: 20
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
                anchors.left: player_offer.left
                anchors.top: wood_client_offer.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.rightMargin: 20
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
                anchors.right: blank.left
                anchors.top: ptf.top
                anchors.margins: 10
                anchors.topMargin: 10
                anchors.rightMargin: 20
                anchors.leftMargin: 0
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
                anchors.left: player_demand.left
                anchors.top: player_demand.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
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
               anchors.left: player_demand.left
                anchors.top: stone_client_demand.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
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
               anchors.left: player_demand.left
                anchors.top: iron_client_demand.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
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
               anchors.left: player_demand.left
                anchors.top: wood_client_demand.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
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
                text: "Actual resources"
                anchors.margins: 10
                anchors.topMargin: 10
                anchors.right: ptf.right
                anchors.leftMargin: 10
                anchors.top: ptf.top
                color: "Green"
                opacity: 1000
                readOnly: true
            }
            TextField
            {
                id: send_stone
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: ""
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
                text: ""
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
                text: ""
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
                text: ""
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
                    anchors.fill: parent
                    onClicked:{
//                        ptfq.visible = false;
                        ptf.check_resources();
                        backend.acceptTrade(send_wood.text, send_stone.text, send_iron.text, send_food.text);
                        ptf.clean();
                        ptf.fetch();
                    }
                }
            }
            Button{
                id: client_decline
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: "DECLINE"
                anchors.left: food.left
                anchors.top: food.bottom

                anchors.margins: 10
                anchors.leftMargin: 0
                //anchors.topMargin: 0
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
//                        ptfq.visible = false;
                        backend.denyTrade();
                        ptf.clean();
                        ptf.fetch();
                    }
                }
            }
            Button{
                id: previous_trade
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: "PREVIOUS TRADE"
                anchors.left: food_client_demand.left
                anchors.top: food_client_demand.bottom
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
            Button{
                id: close
                height: ptf.height /8.2
                width: ptf.width /4.3
                text: "CLOSE"
                anchors.right: client_trade.right
                anchors.top: client_trade.bottom
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 10
                MouseArea {
                    anchors.fill: close;
                    onClicked: {
                        ptfq.visible = false
                    }
                }
            }
        }

    }Item{
        id: rf
        height: parent.height/1.4
        width: parent.width/3.5
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 10
        anchors.leftMargin: 10
                    TextField{
                     id: yr
                     readOnly: true
                     height: rf.height /4
                     width: rf.width /1
                     text: "Your resources"
                     anchors.top: parent.top
                     anchors.left: parent.left
                    }
                    TextField{
                        readOnly: true
                        id: food_rf
                        height: rf.height /4
                        width: rf.width /2
                        text: "FOOD:"
                        anchors.top: yr.bottom
                        anchors.left: yr.left
                    }
                    TextField{
                        readOnly: true
                        id: wood_rf
                        height: rf.height /4
                        width: rf.width /2
                        text: "WOOD:"
                        anchors.top: food_rf.bottom
                        anchors.left: parent.left
                    }
                    TextField{
                        readOnly: true
                        id: stone_rf
                        height: rf.height /4
                        width: rf.width /2
                        text: "STONE:"
                        anchors.top: wood_rf.bottom
                        anchors.left: parent.left
                    }
                    TextField{
                        readOnly: true
                        id: iron_rf
                        height: rf.height /4
                        width: rf.width /2
                        text: "IRON:"
                        anchors.top: stone_rf.bottom
                        anchors.left: parent.left
                    }
                    TextField{
                        readOnly: true
                        id: food_ammount
                        height: rf.height /4
                        width: rf.width /2
                        text: backend.foodRes
                        anchors.top: food_rf.top
                        anchors.left: food_rf.right
                    }
                    TextField{
                        readOnly: true
                        id: wood_ammount
                        height: rf.height /4
                        width: rf.width /2
                        text: backend.woodRes
                        anchors.top: food_ammount.bottom
                        anchors.left: food_ammount.left
                    }
                    TextField{
                        readOnly: true
                        id: stone_ammount
                        height: rf.height /4
                        width: rf.width /2
                        text: backend.stoneRes
                        anchors.top: wood_ammount.bottom
                        anchors.left: wood_ammount.left
                    }
                    TextField{
                        readOnly: true
                        id: iron_ammount
                        height: rf.height /4
                        width: rf.width /2
                        text: backend.ironRes
                        anchors.top: stone_ammount.bottom
                        anchors.left: stone_ammount.left
                 }   }
                }


