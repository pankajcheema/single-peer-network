!# bin/bash

peer chaincode install -n $1 -v $2 -l node -p /opt/gopath/src/github.com/chaincode/nodejs/

peer chaincode upgrade -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.1 -c '{"Args":["addPacket","{\"name\": \"pankaj\",\"description\": \"agsdhagsdhgasjdhgasjdgas\",\"deadline\": \"24\/08\/2019\",\"created_by\": \"pamkaj\"}"]}' -P "AND ('Org1MSP.peer')"