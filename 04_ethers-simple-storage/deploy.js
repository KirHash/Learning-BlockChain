const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();




// In solidity, the progamming language is "synchronous", which means that the program is executed line by line
// Meanwhile javascript can be asynchronous as well which means that two lines can executed parallely at the same time

/*
Example of Synchronous programming: Cooking

1. Put popcorn in microwave
2. Wait for the popcorn to finish
3. Pour drinks for everyone

All these three lines will be executed one-by-one only when the previous line is executed
*/

/*
Example of Asynchronous programming: Cooking

1. Put popcorn in microwave
2. Pour drinks for everyone
3. Wait for the popcorn to finish

In asynchronous programming, line1 and line2 can be executed parallely 
*/

// Setup Movie Night

// Cook popcorn
// Pour Drinks
// Start Movie

// await keyword tells a promise based function to wait for that function to be fulfilled or rejected
// async function setupMovieNight(){
//     await cookPopcorn();
//     await pourDrinks();
//     startMovie();
// }

// function cookPopcorn(){
//     // code
//     return Promise()
// }

// Ethers is the main tool that powers hardhat environment and its library aims for interacting with ETH blockchain and ecosystem.
async function main() {
    // compile them in our code

    // compile them seperately
    // It gives us connection to the blockchain
    const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL);
    // It gives us a wallet with a private key to sign transactions
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

    // Accessing encrypted key 
    // const encryptedJSON = fs.readFileSync("./.encryptedKey.json", "utf-8");
    // let wallet = new ethers.Wallet.fromEncryptedJsonSync(encryptedJSON, process.env.PRIVATE_KEY_PASS);
    // wallet = await wallet.connect(provider);

    // To deploy the contract, we need ABI and Binary compiled code
    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf-8");
    const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf-8");

    // A contract factory is just an object that can be used to deployed contracts
    // Passed the abi, so that our code knows how to interact with the contract
    // Passed the binary, becuase it is the main compiled code
    // Passed the wallet, so that wehave a private key to sign while deploying the contract
    const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
    console.log("Deploying, please wait...");
    
    // Await keyword is used in deployment of the contract so as to stop here and wait till the deployment gets done before moving further 
    // The await will also resolve the promise after its work get completed
    // When await is used it returns a promise that resolves to a contract, and we are waiting for it to finish deploying to resolve into a contract object
    const contract = await contractFactory.deploy();

    // Adding overrides for transactions
    // const contract = await contractFactory.deploy({gasPrice: 100000000000000});

    // Transaction Receipt
    // wait function is used to specify the number of block confirmation we want to wait

    // Transaction Receipt is what we get when we wait for the block confirmation
    await contract.deployTransaction.wait(1);
    console.log(`Contract Address: ${contract.address}`);
    
    // console.log("Here is the deployment transaction: ");
    // console.log(contract.deployTransaction);
    
    // // Transaction Receipt or Transaction Response is what we get when we create  the transaction
    // console.log("Here is the transaction receipt: ");
    // console.log(transactionReceipt);
    
    // Sending a contract only using transaction data
    // console.log("Deploying using only transaction data!");
    // const nonce = await wallet.getTransactionCount();
    // const tx = {
    //     // Nonce in wallet is a number associated with a unique transaction
    //     nonce: nonce,
    //     gasPrice: 20000000000,
    //     gasLimit: 6721975,
    //     to: null,
    //     value: 0,
    //     data: "0x608060405234801561001057600080fd5b50610771806100206000396000f3fe608060405234801561001057600080fd5b50600436106100575760003560e01c80632e64cec11461005c5780636057361d1461007a5780636f760f41146100965780638bab8dd5146100b25780639e7a13ad146100e2575b600080fd5b610064610113565b604051610071919061052a565b60405180910390f35b610094600480360381019061008f919061046d565b61011c565b005b6100b060048036038101906100ab9190610411565b610126565b005b6100cc60048036038101906100c791906103c8565b6101b6565b6040516100d9919061052a565b60405180910390f35b6100fc60048036038101906100f7919061046d565b6101e4565b60405161010a929190610545565b60405180910390f35b60008054905090565b8060008190555050565b6001604051806040016040528083815260200184815250908060018154018082558091505060019003906000526020600020906002020160009091909190915060008201518160000155602082015181600101908051906020019061018c9291906102a0565b505050806002836040516101a09190610513565b9081526020016040518091039020819055505050565b6002818051602081018201805184825260208301602085012081835280955050505050506000915090505481565b600181815481106101f457600080fd5b906000526020600020906002020160009150905080600001549080600101805461021d9061063e565b80601f01602080910402602001604051908101604052809291908181526020018280546102499061063e565b80156102965780601f1061026b57610100808354040283529160200191610296565b820191906000526020600020905b81548152906001019060200180831161027957829003601f168201915b5050505050905082565b8280546102ac9061063e565b90600052602060002090601f0160209004810192826102ce5760008555610315565b82601f106102e757805160ff1916838001178555610315565b82800160010185558215610315579182015b828111156103145782518255916020019190600101906102f9565b5b5090506103229190610326565b5090565b5b8082111561033f576000816000905550600101610327565b5090565b60006103566103518461059a565b610575565b90508281526020810184848401111561037257610371610704565b5b61037d8482856105fc565b509392505050565b600082601f83011261039a576103996106ff565b5b81356103aa848260208601610343565b91505092915050565b6000813590506103c281610724565b92915050565b6000602082840312156103de576103dd61070e565b5b600082013567ffffffffffffffff8111156103fc576103fb610709565b5b61040884828501610385565b91505092915050565b600080604083850312156104285761042761070e565b5b600083013567ffffffffffffffff81111561044657610445610709565b5b61045285828601610385565b9250506020610463858286016103b3565b9150509250929050565b6000602082840312156104835761048261070e565b5b6000610491848285016103b3565b91505092915050565b60006104a5826105cb565b6104af81856105d6565b93506104bf81856020860161060b565b6104c881610713565b840191505092915050565b60006104de826105cb565b6104e881856105e7565b93506104f881856020860161060b565b80840191505092915050565b61050d816105f2565b82525050565b600061051f82846104d3565b915081905092915050565b600060208201905061053f6000830184610504565b92915050565b600060408201905061055a6000830185610504565b818103602083015261056c818461049a565b90509392505050565b600061057f610590565b905061058b8282610670565b919050565b6000604051905090565b600067ffffffffffffffff8211156105b5576105b46106d0565b5b6105be82610713565b9050602081019050919050565b600081519050919050565b600082825260208201905092915050565b600081905092915050565b6000819050919050565b82818337600083830152505050565b60005b8381101561062957808201518184015260208101905061060e565b83811115610638576000848401525b50505050565b6000600282049050600182168061065657607f821691505b6020821081141561066a576106696106a1565b5b50919050565b61067982610713565b810181811067ffffffffffffffff82111715610698576106976106d0565b5b80604052505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b600080fd5b600080fd5b600080fd5b600080fd5b6000601f19601f8301169050919050565b61072d816105f2565b811461073857600080fd5b5056fea2646970667358221220668bb4da3926a8ae6b2037d98212ac8b802bef0d523ddc2d7720bcc622c63fb664736f6c63430008070033",
    //     chainId: 1337
    // };
    
    // Signing the transaction
    // const signedTxRes =  await wallet.signTransaction(tx);
    // console.log(signedTxRes);
    
    // Sending the transaction
    // const sentTxRes =  await wallet.sendTransaction(tx);
    // await sentTxRes.wait(1);
    // console.log(sentTxRes);

    // Interacting with the contract to get the number
    const currFavNum = await contract.retrieve();
    console.log(`Current Favorite Number: ${currFavNum.toString()}`);
    
    // Store function
    const transactionRes = await contract.store("7");
    const transactionReceipt = await transactionRes.wait(1);
    const updateFavNum = await contract.retrieve();
    console.log(`Updated Favorite Number: ${updateFavNum}`);
    
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });