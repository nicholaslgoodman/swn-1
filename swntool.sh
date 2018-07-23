#!/bin/bash

for i in $(seq 1 $3); do ruby $1.rb >> $2; printf "\n" >> $2; done
