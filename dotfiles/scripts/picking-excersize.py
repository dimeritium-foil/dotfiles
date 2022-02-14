#!/bin/env python

from random import randint
from time import sleep

strings = ["low E", "A", "D", "G", "B", "high E"]

while True:

    print(strings[randint(0, 5)])
    sleep(2)
