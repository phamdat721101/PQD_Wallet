var myWallet=artifacts.require("./PQD.sol");
module.exports=function(deployer){
	deployer.deploy(myWallet);
};