import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import trade.backend 1.0


/************************************************************************************************************************
*                                                   I have never thought                                                *
*                                                   I'd live to see the day                                             *
*                                                   when my code looks so bad                                           *
*                                                   it makes me cry                                                     *
*                                                                        -Matjaz                                        *
*                                                                                                                       *
************************************************************************************************************************/

Image{
    id:tfp
    anchors.centerIn: parent
    height: parent.height /3.5
    width: parent.width /2
    function check_resources(){
        var food = Number(food_resource.text);
        var wood = Number(wood_resource.text);
        var stone = Number(stone_resource.text);
        var iron = Number(iron_resource.text);

        var back_food = Number(backend.foodRes);
        var back_wood = Number(backend.woodRes);
        var back_stone = Number(backend.stoneRes);
        var back_iron = Number(backend.ironRes);

        if (back_food < food || food < 0)
        {
            food_resource.text="0";
        }
        if (back_wood < wood || wood < 0)
        {
            wood_resource.text="0";
        }
        if (back_stone < stone || stone < 0)
        {
            stone_resource.text="0";
        }
        if (back_iron < iron || iron < 0)
        {
            iron_resource.text="0";
        }
    }
    Rectangle{
        height: parent.height
        width: parent.width

        color: "Black"
        Item {
            id: tf
            width: parent.width
            height: parent.height
            TextField
            {
                id: stone
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: offer.left
                anchors.top: offer.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("stoneOffered", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: iron_sent
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: stone_sent.left
                anchors.top: stone_sent.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("ironOffered", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: wood_sent
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: iron_sent.left
                anchors.top: iron_sent.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("woodOffered", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: food_sent
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: wood_sent.left
                anchors.top: wood_sent.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("foodOffered", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: stone_requested
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: request.left
                anchors.top: request.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("stoneRequested", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: iron_requested
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: stone_requested.left
                anchors.top: stone_requested.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("ironRequested", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: wood_requested
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: iron_requested.left
                anchors.top: iron_requested.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("woodRequested", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: food_requested
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: wood_requested.left
                anchors.top: wood_requested.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("foodRequested", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: stone_resource
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: resource.left
                anchors.top: resource.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("stoneGiven", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: iron_resource
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: stone_resource.left
                anchors.top: stone_resource.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("ironGiven", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: wood_resource
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: iron_resource.left
                anchors.top: iron_resource.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("woodGiven", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: food_resource
                height: tf.height / 8.2
                width: tf.width / 4.5
                anchors.margins: 10
                anchors.leftMargin: 0
                anchors.left: wood_resource.left
                anchors.top: wood_resource.bottom
                validator: IntValidator{
                    bottom: 0
                    top: 999999
                }
                selectByMouse: true
                onTextChanged: backend.setTradeProperty("foodGiven", text)
                color: "Green"
                opacity: 1000
            }
            TextField
            {
                id: blank
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
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
                height: tf.height / 8.2
                width: tf.width / 4.5
                text: "CLEAR"
                anchors.right: food_requested.right
                anchors.top: food_requested.bottom
                anchors.margins: 10
                MouseArea {
                    anchors.fill: clear
                    onClicked: {
                        backend.clearTrade()
                        stone_sent.clear()
                        food_sent.clear()
                        iron_sent.clear()
                        wood_sent.clear()
                        stone_requested.clear()
                        food_requested.clear()
                        iron_requested.clear()
                        wood_requested.clear()
                        stone_resource.clear()
                        iron_resource.clear()
                        wood_resource.clear()
                        food_resource.clear()
                    }
                }
            }
            Button{
                id: send
                height: tf.height / 8.2
                width: tf.width / 4.5
                text: "TRADE"
                anchors.right: food_resource.right
                anchors.top: food_resource.bottom
                anchors.margins: 10

                MouseArea {
                    anchors.fill: send
                    onClicked: {
                        tfp.check_resources()
                        backend.sendTrade()
                        tfp.visible=false;
                        stone_sent.clear()
                        food_sent.clear()
                        iron_sent.clear()
                        wood_sent.clear()
                        stone_requested.clear()
                        food_requested.clear()
                        iron_requested.clear()
                        wood_requested.clear()
                        stone_resource.clear()
                        iron_resource.clear()
                        wood_resource.clear()
                        food_resource.clear()
                    }
                }
            }
        }
    }
}
