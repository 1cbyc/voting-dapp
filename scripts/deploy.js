const hre = require("hardhat");

async function main() {
  const Voting = await hre.ethers.getContractFactory("Voting");

  const candidates = ["Isaac", "James", "Eddy"];
  const voting = await Voting.deploy(candidates);

//   await voting.deployed();
  await voting.waitForDeployment();

//   console.log("Voting contract deployed to:", voting.address);
  console.log("Voting contract deployed to:", voting.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
