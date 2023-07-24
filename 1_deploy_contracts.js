// 2_deploy_contracts.js

const EscrowContract = artifacts.require("./Escrow.sol");

module.exports = function (deployer) {
  // Deploy SimpleStorage contract
  deployer.deploy(EscrowContract);
};
