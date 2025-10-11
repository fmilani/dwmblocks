#!/bin/bash

free -h | sed -n '2{p;q}' | awk '{printf ("🧠 %.1fG", $3)}'

