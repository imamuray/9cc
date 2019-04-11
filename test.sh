#!/bin/bash
try() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$expected expected, but got $actual"
    exit 1
  fi
}

try 0 0
try 42 42
try 10 '2*5'
try 10 '2 * 5'
try 16 '3*5+1'
try 16 '1+3*5'
try 55 '4*10+3*5'
try 39 '4+10*3+5'

echo OK
