!# bin/bash
export CHANNEL_NAME=mychannel

echo "creating channel >>>>>>>>>>>>>>>>>>>>"

peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

echo "channel join"

peer channel join -b mychannel.block

echo "installing chaincode"

peer chaincode install -n $1 -v $2 -l node -p /opt/gopath/src/github.com/chaincode/nodejs/
sleep 5
echo "instansiating chaincode"

peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n $1 -v $2 -c '{"Args":[]}' -P "AND ('Org1MSP.peer')"

sleep 10

peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n mycc --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt -c '{"Args":["addPacket","{\"name\": \"pankaj\",\"description\": \"agsdhagsdhgasjdhgasjdgas\",\"deadline\": \"24\/08\/2019\",\"created_by\": \"pamkaj\"}"]}' 