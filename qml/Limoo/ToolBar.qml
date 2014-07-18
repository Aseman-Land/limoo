/*
    Copyright (C) 2014 Sialan Labs
    http://labs.sialan.org

    Limoo is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Limoo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import org.sialan.limoo 1.0

Rectangle {
    id: toolbar
    height: Limoo.desktopSession == Enums.Gnome? 46*physicalPlatformScale : 36*physicalPlatformScale
    clip: true
    color: blurBack? "#88ffffff" : Limoo.titleBarColor

    Rectangle {
        anchors.fill: parent
        opacity: Limoo.desktopSession == Enums.Kde? 0 : 1
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#20000000" }
            GradientStop { position: 0.7; color: "#00000000" }
            GradientStop { position: 1.0; color: "#05000000" }
        }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1*physicalPlatformScale
        opacity: Limoo.desktopSession == Enums.Kde? 0 : 1
        color: "#22000000"
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
    }

    Row {
        anchors.top: parent.top
        anchors.topMargin: 1*physicalPlatformScale
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        spacing: 6*physicalPlatformScale

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: qsTr("Back")
            icon: "files/go-previous.png"
            textColor: Limoo.titleBarTextColor
            highlightColor: "#22000000"
            onClicked: main.back()
        }

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: qsTr("Rotate Left")
            icon: "files/rotate-left.png"
            textColor: Limoo.titleBarTextColor
            highlightColor: "#22000000"
            visible: viewMode
//            onClicked: Limoo.fullScreen = !Limoo.fullScreen
        }

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: qsTr("Rotate Right")
            icon: "files/rotate-right.png"
            textColor: Limoo.titleBarTextColor
            highlightColor: "#22000000"
            visible: viewMode
//            onClicked: Limoo.fullScreen = !Limoo.fullScreen
        }

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: qsTr("Fullscreen")
            icon: "files/view-fullscreen.png"
            textColor: Limoo.titleBarTextColor
            highlightColor: "#22000000"
            onClicked: Limoo.fullScreen = !Limoo.fullScreen
        }

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: qsTr("About Limoo")
            icon: "files/help-about.png"
            textColor: Limoo.titleBarTextColor
            highlightColor: "#22000000"
            onClicked: main.about = true
        }

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: qsTr("Sialan")
            icon: "files/help-about.png"
            textColor: Limoo.titleBarTextColor
            highlightColor: "#22000000"
            onClicked: main.about = true
        }
    }

    Button {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.topMargin: 1*physicalPlatformScale
        text: qsTr("Thumbnails")
        textColor: Limoo.titleBarTextColor
        highlightColor: "#22000000"
        normalColor: Limoo.thumbnailBar? "#15000000" : "#00000000"
        onClicked: Limoo.thumbnailBar = !Limoo.thumbnailBar
    }
}
