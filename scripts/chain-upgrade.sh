!# bin/bash

peer chaincode install -n $1 -v $2 -l node -p /opt/gopath/src/github.com/chaincode/nodejs/

peer chaincode upgrade -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n $1 -v $2 -c '{"Args":[]}' -P "AND ('Org1MSP.peer')"