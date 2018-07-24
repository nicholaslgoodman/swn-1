#!/bin/bash
if [ $# -eq 3 ]
   then
      ruby $1.rb $2 >> $3 
elif [ $# -eq 2 ]
   then
      ruby $1.rb $2
elif [ $# -eq 1 ]
   then
      ruby $1.rb
fi
