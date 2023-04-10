Web3 = require('web3')
web3 = new Web3('http://127.0.0.1:7545')


var contractAddress = '0x444adF6189D88644255680B75a28f4765A57D095'
var abi = require('./BatteryStorage.json')
var walletAddress = '0x6F3768cB18c043d5fdb075D045c0912801F892E5'

let contract = new web3.eth.Contract(abi.abi, contractAddress)

//contract.methods.setMaterial(1,'Lithium mined in blah blah blah','Company name',["Cert1","Cert2"]).send({from: walletAddress})
//contract.methods.getMaterial('mat_1_lithium').call({from: walletAddress})
contract.methods.getMaterials().call({from: walletAddress})
