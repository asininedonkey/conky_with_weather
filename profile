export IP=`curl "ip.cn" --silent | cut -d' ' -f 2 | cut -d'：' -f 2`
export CITY=`curl "ip.cn" --silent | cut -d' ' -f 3 | sed 's/.*省\(.*\)市/\1/'`
export CITY_CODE=`cat /home/zhl/.conky/yahoo-city-code.txt | grep $CITY | cut -d' ' -f 2`
