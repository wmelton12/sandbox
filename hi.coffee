#!/usr/bin/env coffee

foods = ["banana","watermelon","pasta","lasagna"]
eat = (foods...) -> 
        console.log "Eating "+food  for food in foods
eat foods...

