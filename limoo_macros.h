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

#ifndef LIMOO_MACROS_H
#define LIMOO_MACROS_H

#include <QDir>
#include <QCoreApplication>

#ifdef Q_OS_WIN
#define HOME_PATH QString(QDir::homePath() + "/AppData/Local/sialan/limoo")
#else
#define HOME_PATH QString(QDir::homePath() + "/.config/sialan/limoo")
#endif

#define CONF_PATH QString(HOME_PATH + "/config.ini")
#define PLUGINS_LOCAL_PATH  QString(HOME_PATH + "/plugins")
#define PLUGINS_PUBLIC_PATH QString(QCoreApplication::applicationDirPath() + "/plugins")

#endif // LIMOO_MACROS_H