#!/bin/bash
for run in {1..10}; do ruby alien.rb >> aliens.txt; printf "\n" >> aliens.txt; done
