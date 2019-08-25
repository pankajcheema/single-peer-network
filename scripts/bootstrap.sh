!# bin/bash
export CHANNEL_NAME=mychannel

echo "creating channel >>>>>>>>>>>>>>>>>>>>"

peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

echo "channel join"

peer channel join -b mychannel.block

echo "installing chaincode"

peer chaincode install -n mycc -v 1.0 -l node -p /opt/gopath/src/github.com/chaincode/nodejs/
sleep 5
echo "instansiating chaincode"

peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":[]}' -P "AND ('Org1MSP.peer')"