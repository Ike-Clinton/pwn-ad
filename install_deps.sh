#!/bin/bash

# Aptitude requirements
apt-get install -y libssl-dev libffi-dev python-dev build-essential

# Grab repos
git clone https://github.com/lgandx/Responder.git
git clone https://github.com/CoreSecurity/impacket.git
git clone https://github.com/byt3bl33d3r/CrackMapExec.git
git clone -b dev https://github.com/EmpireProject/Empire.git
git clone https://github.com/byt3bl33d3r/DeathStar.git

# Install misc pip requirements not in setup.py filles
pip install -r requirements.txt

# Run setup for Responder
cp Responder.conf ../Responder

# Run setup for impacket
cd ../impacket
python setup.py install



# Run setup for CrackMapExec
cd ../CrackMapExec
python setup.py install


# Run setup for Empire
cd ../Empire/setup
./install.sh


# Run setup for DeathStar
cd ../DeathStar
pip install -r requirements.txt