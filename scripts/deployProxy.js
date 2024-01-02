const { ethers, upgrades } = require("hardhat");
require('dotenv').config()

async function main() {
  console.log("NFT Contract Deploying....");
  const NFTContract = await ethers.getContractFactory("EnterpriseNFT");
  console.log("Deployed Contract Address", await NFTContract);

  
  console.log("Deploying Contract....");
  
  const nftContract = await upgrades.deployProxy(NFTContract, ['0x911783781755C7A8cE91898C6E19ee057ba94dB6'], {kind : 'uups'}, {initializer : 'initalize'});
  await nftContract.waitForDeployment();
  console.log("Box deployed to:", await nftContract.getAddress());
}

main();