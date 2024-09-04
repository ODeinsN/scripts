#!/usr/bin/bash

echo " "

message=$1
size=${#message}
symbol="-"

header_len_max=128
while [ $header_len_max -lt $size ]; do 
	header_len_max=$(($header_len_max*2))
done

header_len=$(($header_len_max-$size))


result_message=""
	

for (( i = 0; i < $(($header_len/2)); i++ )); do
	result_message="${result_message}${symbol}"
done

result_message="${result_message}${message}"

for (( i = $(($header_len/2)); i < header_len; i++ )); do
	result_message="${result_message}${symbol}"
done

echo "$result_message"

