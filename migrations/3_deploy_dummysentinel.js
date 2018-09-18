var DummySentinel = artifacts.require("./DummySentinel.sol");

module.exports = function(deployer) {
  deployer.deploy(DummySentinel);
};
