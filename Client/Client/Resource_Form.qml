import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

Rectangle{
    visible: true
    enabled: false


    Item{

        TextField{
            id: food
            text: "FOOD:"
            anchors.top: parent.top
            anchors.left: parent.left

        }
        TextField{
            id: wood
            text: "WOOD:"
            anchors.top: food.bottom
            anchors.left: parent.left

        }
        TextField{
            id: stone
            text: "STONE:"
            anchors.top: wood.bottom
            anchors.left: parent.left

        }
        TextField{
            id: iron
            text: "IRON:"
            anchors.top: stone.bottom
            anchors.left: parent.left

        }
        TextField{
            id: food_ammount
            text: backend.foodRes
            anchors.top: food.top
            anchors.left: food.right
        }
        TextField{
            id: wood_ammount
            text: backend.woodRes
            anchors.top: food_ammount.bottom
            anchors.left: food_ammount.left
        }
        TextField{
            id: stone_ammount
            text: backend.stoneRes
            anchors.top: wood_ammount.bottom
            anchors.left: wood_ammount.left
        }
        TextField{
            id: iron_ammount
            text: backend.ironRes
            anchors.top: stone_ammount.bottom
            anchors.left: stone_ammount.left
        }
    }

}
