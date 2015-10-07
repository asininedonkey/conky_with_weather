#!/usr/bin/env bash

conky_dir=~/.conky/
icons_dir=${conky_dir}icons/weather/
weather_xslt=${conky_dir}weather.xslt
weather_xml=${conky_dir}weather.xml


function get_weather_xml() {
        #export IP=`curl "ip.cn" --silent | cut -d' ' -f 2 | cut -d'：' -f 2`
        #export CITY=`curl "ip.cn" --silent | cut -d' ' -f 3 | sed 's/.*省\(.*\)市/\1/'`
        #export CITY_CODE=`cat ~/.conky/yahoo-city-code.txt | grep $CITY | cut -d' ' -f 2`
        #echo $IP
        #echo $CITY
        #echo $CITY_CODE

        wget "http://xml.weather.com/weather/local/${CITY_CODE}?cc=*&unit=m&dayf=3" -O ~/.conky/weather.xml
}

function xsltproc_run() {
        result=""
        if [ $# -lt 1 ] ; then
                echo "error use way!"
                return 1
        fi

        day_number=$1
        result=$(xsltproc --stringparam day $day_number $weather_xslt $weather_xml)
        if [ $# -eq 1 ] ; then
                echo $result
        else
                field=$2
                echo $result | cut -d "|" -f$field
        fi
        return 0
}

function get_weather_day() {
        day=$1
        echo $(xsltproc_run $day 3)
}

function get_weather_icons() {
        day=$1
        #echo $icons_dir$(xsltproc_run $day 6).png
        cp $icons_dir$(xsltproc_run $day 6).png /tmp/weather$day.png
        #echo $icons_dir$(xsltproc_run $day 7).png
        cp $icons_dir$(xsltproc_run $day 7).png /tmp/weathern$day.png
        return 0
}

function get_weather_temperature() {
        day=$1
        if [ $# -eq 1 ] ; then
                result=$(xsltproc_run $day 4,5)
        elif [ $# -eq 2 ] ; then
                ftemp=$2
                if [ "$ftemp" == "low" ] ; then
                        result=$(xsltproc_run $day 4)
                        echo $result
                        return 0
                elif [ "$ftemp" == "hi" ] ; then
                        result=$(xsltproc_run $day 5)
                        echo $result
                        return 0
                fi
        fi
        echo "error use way!"
}
