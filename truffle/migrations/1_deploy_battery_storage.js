const BatteryStorage = artifacts.require("BatteryStorage");

module.exports = function (deployer) {
  deployer.deploy(BatteryStorage);
};