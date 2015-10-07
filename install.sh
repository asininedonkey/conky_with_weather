#!/bin/bash

cat profile >> /etc/profile

cp conkyrc /home/zhl/.conkyrc
chown zhl:zhl /home/zhl/.conkyrc

cp -r conky/* /home/zhl/.conky/
chown zhl:zhl /home/zhl/.conky/ -R

#shutdown -r now
