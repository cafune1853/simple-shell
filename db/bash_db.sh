#!/bin/bash

dbSet(){
	echo "$1:$2" >> db      	
}

dbGet(){
	grep "$1" db | sed -e "s/$1://" | tail -n 1
}
