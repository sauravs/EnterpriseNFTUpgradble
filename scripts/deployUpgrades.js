const { ethers, upgrades } = require("hardhat");

async function main() {
  const BoxV2 = await ethers.getContractFactory("EnterpriseNFT");
  const box = await upgrades.upgradeProxy(BOX_ADDRESS, EnterpriseNFT);
  console.log("EnterpriseNFT upgraded");
}

main();