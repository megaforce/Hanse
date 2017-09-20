import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

/************************************************************************************************************************
*                                                   I mean...                                                           *
*                                                   It works...                                                         *
*                                                   ....Somehow...                                                      *
*                                                                 -Matjaz                                               *
*                                                                                                                       *
************************************************************************************************************************/

Image{
    visible: true

    height: parent.height / 10
    width: parent.width /8
    Item{
        id: rf
        height: parent.height
        width: parent.width
        TextField{
            readOnly: true
            id: food
            height: rf.height /4
            width: rf.width /2
            text: "FOOD:"
            anchors.top: parent.top
            anchors.left: parent.left
        }
        TextField{
            readOnly: true
            id: wood
            height: rf.height /4
            width: rf.width /2
            text: "WOOD:"
            anchors.top: food.bottom
            anchors.left: parent.left
        }
        TextField{
            readOnly: true
            id: stone
            height: rf.height /4
            width: rf.width /2
            text: "STONE:"
            anchors.top: wood.bottom
            anchors.left: parent.left
        }
        TextField{
            readOnly: true
            id: iron
            height: rf.height /4
            width: rf.width /2
            text: "IRON:"
            anchors.top: stone.bottom
            anchors.left: parent.left
        }
        TextField{
            readOnly: true
            id: food_ammount
            height: rf.height /4
            width: rf.width /2
            text: backend.foodRes
            anchors.top: food.top
            anchors.left: food.right
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
        }
    }
}
