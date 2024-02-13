#!/bin/bash

while true; do cat /home/maciek/dashboard/index.http | nc -l 80 -N; done