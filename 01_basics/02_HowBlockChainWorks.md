# How the Blockchain Works ?

## What is hash ?
Hash: A unqiue fixed length string, meant to identify a piece of data. They are created by putting some data into a "hash function"
ETH uses Keccak256 hash as its hashing algorithm

The data is put into the data column which is converted into a hash (unique identifier) using the hashing algorithm. But the length of the hash doesnt change
https://andersbrownworth.com/blockchain/hash

## A Block
The Block consists of three components: Block number, Nonce and Data
It is list of transaction mined together
Importance of Nonce:
The nonce (number use once), is a 5 digit number, that is used by the miner to satisfy certain requirement in hash until it leads to a set of four zeroes in the starting. This ensures legitimacy of the block and prohibits the tampering of the data.
It is also used to define the transaction number for an account or address
https://andersbrownworth.com/blockchain/block

## A Blockchain
A blockchain is a combination of blocks. The blockchain contains of another component known as Prev which consists of the hash of the previous block

Genesis Block: It is the first block of the blockchain
https://andersbrownworth.com/blockchain/blockchain

Blockchains are immutable because once you try to change the value in any of the block in the data, the rest of the block are rendered useless

### Properties of Blockchain
1. Immutable
2. Transparent
3. Distributive in nature
4. It is a ledger

## Distributed Blockchains
Distributed Blockchains: Not only they are a combination of blockchains but there are multiple peers connected peer to peer and all these peers are weighted equally
https://andersbrownworth.com/blockchain/distributed
For example: In Peer A, if we chnage the data in any of the block and once we mine the block, the hash of the block in peer A becomes different from the same block number available in Peer B or Peer C. This kicks Peer A from the distributed system if that block does not reverts it hash or value back to normal and Peer A becomes whole new blockchain in itself

Blockchains can not be malicously manipulated. 
If any of the transaction gets manipulated either the whole chain gets ruined since the hashes no longer have a set of zero to match the legitimacy of the block or the hash of the block in one peer doesnt matches the same block number in another peer, due to which the manipulated blockchain ends up getting kicked from the distributed blockchain
https://andersbrownworth.com/blockchain/tokens

## Signing Transactions and Signatures
Private Key: It is a key that is only known to the key holder and is used to sign transactions
And with the help of a digital signature algorithm, a public key is generated

A user signs a transaction using the private key and it can be verified using the public key
https://andersbrownworth.com/blockchain/public-private-keys/keys

In Signatures, a message and a unique private keys derives a message signatures while signing. 
But while verifying, it requires public key and the signature. If the signature (transaction) is manipulated, it will not verify
https://andersbrownworth.com/blockchain/public-private-keys/signatures

The etherium address is our piece of public key

### Derivation order
Private key ||| > Public Key > Address
Private key creates Public key, which further creates our address

Blockchains are resilient. Even if one node running mutliple entities goes down, there are still other independent nodes running. The blockchain and the system will persist as long as there is one node running

## Blockchain Mining
Whenever we perform a transaction, that transaction is stored in an area called "mempool". A group of miners pick the transaction and try to add it to a block. When they try to add the transaction to a block, they have solve a mathematical problem. When solved, the block is created. The block communicates to the group of miner and the miners try to verify its validity. When proved valid, the block is added to the blockchain network and the miner is awarded

## Consenus
Consenus is a mechanism that validates a transaction and marks it as authentic
For example: If one of the blockchain alters and the other two dont, then according to the majority that one altered blockchain gets kicked out from the system

### Types of Consenus
Consenus system cab be broken down to:
1. Chain Selection
2. Sybil Resistance: It is a mechanism that defends itself against somebody from creating fake instances or nodes. It's a verifiable way to figure out who the author is:
    <br>
    a. Proof of Work: It is a type of sybil resistance in which a single node has to go through very              computionally expensive process(mining) to figure out the correct nonce, and no matter how many            accounts one has, every account has to throught the process
       It uses a lot of energy as all the nodes are simultaneouly working to find the answer of the 
       blockchain riddle so that they recieve the transaction fee
    <br>
    b. Proof of stake: Instead of solving a difficult problem, it puts up some collateral (stake) that 
       they are going to behave honestly. 
       But if they misbehave, some of the stake is removed. Here Miners are called Validators. Mobile and 
       Laptops are enough unlike in POW that requires high performance hardware.
       It uses less energy

Bitcoin and Etherium uses Nakamoto Consenus that is basically a combination of PoW and longest chain rule

Gas fees are paid by whoever initialises the transaction

## Types of attacks
1. Sybil Attack: When the user creates multiple psuedo anoynomous accounts to influence the network
2. 51% Attack: When the attacker has more han 50% of the control over the whole network, it becomes the longest chain in the network and rest of the network follows the longest chain

## Scalability issue:
The issue is that a block does not have enough space for multiple transactions due to which the gas price skyrockets.

## Sharding
It is the solution to the scalability problem in the blockchain. A sharded blockchain is a blocchain of blockchains.There is main chain that is going to coordinate with the several chain that hooks into the main chain. This effectively increases the block space and the number of transactions on a blockchain layer. 
 
## Types of Layers
Layer 1: Base layer blockchain implementation. For example: Bitcoin, Etherium, etc
Layer 2: Any application that is built upon layer 

## Rollups
It is kind of like a sharded chain that derive its security from the base layer and they bulk send their transaction to layer 1.
But they are different from side chains as side chains derive their security from their own protocols
