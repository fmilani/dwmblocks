#!/bin/sh

free --mebi | sed -n '2{p;q}' | awk '{printf ("🧠%2dG\n", ( $3 / 1024))}'

