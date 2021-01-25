#!/usr/bin/env python3

import json
import os

with open(os.path.expanduser("~/.config/imupc.json"), "r") as f:
    raw_json = f.read()

dict_json = json.loads(raw_json)
i = 0
for key in dict_json["args"]:
    if i != 0:
        print(" ", end="")
    print(f"-F '{key}'='{dict_json['args'][key]}'", end="")
    i += 1

print()
