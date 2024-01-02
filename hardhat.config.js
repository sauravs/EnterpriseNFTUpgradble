require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-foundry");

require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    mumbai: {
      url: process.env.POLYGON_TESTNET_URL,
      // chainId : 5001,
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
        // accounts: [`0x${process.env.PRIVATE_KEY}` as string],
    }
  },
  solidity: {
    version : "0.8.20",
    settings : {
      optimizer : {
        enabled :  true,
        runs : 200
      }
    }
  }
};
