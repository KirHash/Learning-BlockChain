// imports
const {ethers, run, network} = require("hardhat") // package ethers does not know about the contracts itself, but hardhat package does know about the contracts by itself. Hardhat also knows that the contracts are compiled or not
require("@nomicfoundation/hardhat-verify");

// async main
async function main(){
  const SimpleStorageFactory = await ethers.getContractFactory(
    "SimpleStorage"
  );
  console.log("Deploying contract");
  const simpleStorage = await SimpleStorageFactory.deploy();
  console.log("Waiting for deploying");
  // await simpleStorage.deployed();
  console.log(`Deployed contract to: ${await simpleStorage.getAddress()}`);
  
  

  // console.log(network.config);
  if (network.config.chainId === 11155111 && process.env.ETHERSCAN_API_KEY) {
    console.log("Waiting for block confirmations...");
    
    
    await simpleStorage.deploymentTransaction().wait(6);
    await verify(simpleStorage.target, []);
  }

  // Interacting with the contract
  const currVal = await simpleStorage.retrieve();
  console.log(`Current value is: ${currVal}`);
  
  // Update the current value
  const transactionResponse = await simpleStorage.store(7);
  await transactionResponse.wait(1);
  const updatedVal = await simpleStorage.retrieve();
  console.log(`Updated value is: ${updatedVal}`);
  
  
}

// verify
// async function verify(contractAddress, args) {
const verify = async (contractAddress, args) => {
  console.log("Verifying contract...")
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    })
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already Verified!")
    } else {
      console.log(e)
    }
  }
}

// main
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

/*
HARDHAT NETWORK:

Hardhat comes built in with the Hardhat Network, it allows to deploy the contract, run tests and debug the code
It is very similar to ganache.
The hardhat network comes with RPC URL and PRIVATE KEY in a psuedo blockchain


HARDHAT CONSOLE:
If one wants to tinker with smart contract, they can spin up a node active and `yarn hardhat console --network localhost`
This activates a hardhat to console to tinker with the smart contract

*/
