#!/bin/bash
systemctl enable ssh
service ssh start
while true; do sleep 1000; done