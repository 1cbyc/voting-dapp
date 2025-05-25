const hre = require("hardhat");

async function main() {
  const Voting = await hre.ethers.getContractFactory("Voting");

  const candidates = ["Alice", "Bob", "Charlie"];
  const voting = await Voting.deploy(candidates);

  await voting.deployed();

  console.log("Voting contract deployed to:", voting.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
