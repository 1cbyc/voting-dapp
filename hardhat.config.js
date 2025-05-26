require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    bsctestnet: {
      url: "https://bsc-testnet.public.blastapi.io",
      accounts: [process.env.PRIVATE_KEY]
    },
  },
};
