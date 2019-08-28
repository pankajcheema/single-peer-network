!# bin/bash
export CHANNEL_NAME=mychannel

echo "creating channel >>>>>>>>>>>>>>>>>>>>"

peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

echo "channel join"

peer channel join -b mychannel.block

echo "installing chaincode"

peer chaincode install -n $1 -v $2 -l node -p /opt/gopath/src/github.com/chaincode/nodejs/


#peer chaincode install -n singleledger-chain -v 1.0 -p github.com/chaincode/singleledger/Chaincodes/SingleLedgerConnectorV1/go/
sleep 5
echo "instansiating chaincode"

peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n $1 -v $2 -c '{"Args":[]}' -P "AND ('Org1MSP.peer')"

#peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n singleledger -v 1.0 -c '{"Args":[]}' -P "AND ('Org1MSP.peer')" --collections-config $GOPATH/src/github.com/chaincode/singleledger/Chaincodes/SingleLedgerConnectorV1/collections_config.json

sleep 10

peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n mycc --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt -c '{"Args":["addPacket","{\"name\": \"pankaj\",\"description\": \"agsdhagsdhgasjdhgasjdgas\",\"deadline\": \"24\/08\/2019\",\"created_by\": \"pamkaj\"}"]}' 



#peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n singleledger-chain --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt -c '{"Args":["RegisterCompany","{\"docType\":\"Corporation\",\"Organization\":\"SlickPie\",\"StructureType\":\"Corporation\",\"Name\":\"CompanyABCD\",\"CompanyEmail\":\"info@companyabcd.com\",\"LegalName\":\"Technical Company ABCD\",\"Website\":\"www.companyabcd.com\",\"Sector\":\"Food,service, aerospace\",\"RegisterCode\":\"349803264328943\",\"CompanyBlockChainID\":\"ahdjkhfkhfkj43hkhkshdkjsahkj23khkjh435h\",\"CompanyId\":12}"]}' --transient "{\"company\":\"$JSONPVT\"}"




#export JSONPVT=$(echo -n "{\"docType\":\"Corporation\",\"RegisterDate\":\"2018-12-11\",\"Address\":{\"StreetName\":\"Boundry Road\",\"BuildingName\":\"Banking House\",\"BuildingNumber\":\"1200\",\"CityName\":\"New York City\",\"PostalZone\":\"10001\",\"State\":\"New York\",\"AddressLine1\":\"5th Floor\",\"AddressLine2\":\"buzzer 10010\",\"Country\":\"USA\"},\"CustomerFaceAddress\":{\"StreetName\":\"Boundry Road\",\"BuildingName\":\"Banking House\",\"BuildingNumber\":\"1200\",\"CityName\":\"New York City\",\"PostalZone\":\"10001\",\"State\":\"New York\",\"AddressLine1\":\"5th Floor\",\"AddressLine2\":\"buzzer 10010\",\"Country\":\"USA\"},\"Contact\":{\"Name\":\"Mrs Bouquet\",\"Telephone\":[\"0158 1233714\",\"213213213\"],\"Telefax\":\"787687686\",\"EMail\":\"info@paypie.com\",\"Position\":\"Manager\"},\"CustomerFaceContact\":{\"Name\":\"Mrs Bouquet\",\"Telephone\":[\"0158 1233714\",\"213213213\"],\"Telefax\":\"787687686\",\"EMail\":\"info@paypie.com\",\"Position\":\"Manager\"},\"NumberOfEmployees\":100,\"IsActive\":true,\"CompanyId\":12,\"BaseCurrency\":{\"CurrencyId\":1,\"Country\":\"China\",\"CurrencyName\":\"Renminbi\"},\"LegalAddress\":{\"StreetName\":\"Boundry Road\",\"BuildingName\":\"Banking House\",\"BuildingNumber\":\"1200\",\"CityName\":\"New York City\",\"PostalZone\":\"10001\",\"State\":\"New York\",\"AddressLine1\":\"5th Floor\",\"AddressLine2\":\"buzzer 10010\",\"Country\":\"USA\"},\"LegalContact\":{\"Name\":\"Mrs Bouquet\",\"Telephone\":[\"0158 1233714\",\"213213213\"],\"Telefax\":\"787687686\",\"EMail\":\"info@paypie.com\",\"Position\":\"Manager\"},\"OnBoardedDate\":\"2019-03-01\",\"ThirdPartyCompanyId\":100}" | base64 | tr -d \\n)


#peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C $CHANNEL_NAME -n singleledger-chain --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt -c '{"Args":["RegisterCompany","{\"docType\":\"Corporation\",\"Organization\":\"SlickPie\",\"StructureType\":\"Corporation\",\"Name\":\"CompanyABCD\",\"CompanyEmail\":\"info@companyabcd.com\",\"LegalName\":\"Technical Company ABCD\",\"Website\":\"www.companyabcd.com\",\"Sector\":\"Food,service, aerospace\",\"RegisterCode\":\"349803264328943\",\"CompanyBlockChainID\":\"ahdjkhfkhfkj43hkhkshdkjsahkj23khkjh435h\",\"CompanyId\":12}"]}' --transient "{\"company\":\"$JSONPVT\"}"