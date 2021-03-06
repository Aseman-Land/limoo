/*
    Copyright (C) 2014 Sialan Labs
    http://labs.sialan.org

    Kaqaz is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Kaqaz is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2

Item {
    id: p_dialog
    anchors.fill: parent
    visible: back.opacity != 0

    property variant item
    property real margin: 10

    property real extraX: 0
    property real extraY: 7*physicalPlatformScale

    MouseArea {
        anchors.fill: parent
        onClicked: p_dialog.hide()
    }

    QtObject {
        id: privates
        property variant lastItem
    }

    AnimationItem {
        id: back
        scale: 1 - 1/40 + opacity/40
        opacity: 0

        onWidthChanged: refresh()
        onHeightChanged: refresh()

        BorderImage {
            id: border
            source: "files/pointer-dialog.png"
            anchors.fill: parent
            border.left: 14
            border.top: 14
            border.right: 14
            border.bottom: 14
        }

        Image {
            source: "files/pointer.png"
            width: 42*physicalPlatformScale
            height: 20*physicalPlatformScale
            smooth: true
            anchors.bottom: border.top
            anchors.bottomMargin: -11
            anchors.left: parent.left
            anchors.leftMargin: width
        }

        Behavior on y {
            NumberAnimation { easing.type: back.easing.type; duration: back.anim? back.anim_time : 0 }
        }
        Behavior on opacity {
            NumberAnimation { easing.type: back.easing.type; duration: back.anim? back.anim_time : 0 }
        }
    }

    onItemChanged: {
        if( item )
            BackHandler.pushHandler(p_dialog,p_dialog.hide)
        else
            BackHandler.removeHandler(p_dialog)

        if( !item )
            return
        if( privates.lastItem )
            privates.lastItem.destroy()

        item.parent = back
        privates.lastItem = item
        refresh()
    }

    function refresh(){
        if( !item )
            return

        item.x = margin
        item.y = margin
        item.width = back.width - 2*margin
        item.height = back.height - 2*margin
    }

    function pointingTo( x, y, width, height ){
        if( x < 0 )
            x = 0
        if( y < 0 )
            y = 0
        if( x + width > p_dialog.width )
            width = p_dialog.width - x
        if( y + height > p_dialog.height )
            height = p_dialog.height - y

        back.x = x - extraX
        back.y = y - extraY
        back.width = width
        back.height = height
        back.opacity = 0

        back.startAnimation()

        back.x = x
        back.y = y
        back.opacity = 1
    }

    function hide(){
        back.startAnimation()

        back.x = back.x - extraX
        back.y = back.y - extraY
        back.opacity = 0
    }
}
