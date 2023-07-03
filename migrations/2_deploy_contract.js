const Jomato = artifacts.require('Jomato')

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(Jomato)
}
