#!/bin/bash

free -h | sed -n '2{p;q}' | awk '{printf ("🧠 %.2fG", $3)}'

