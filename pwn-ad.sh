#!/bin/bash

# Launch Empire with REST API
cd ../Empire
python empire --rest --username user --password "T9w0UEhozS5SPq" --restport 13377

# Launch DeathStar and connect to Empire
cd ../DeathStar
./DeathStar.py -u user -p "T9w0UEhozS5SPq" --url "https://127.0.0.1:13377"