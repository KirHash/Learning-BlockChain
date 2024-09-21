## Ethereum
Ethereum was founded and created by Vitalik Buterin
<br>
The idea behind it was to create a blockchain platform to run programs on blocks.
<br>
ETH also provides token to run programs in the ETH blockchains

## ETH Nodes
ETH is an open sourced decentalized blockchain platform that operates on a P2P network.

### Types of Nodes
1. Full Node: It locally stores a copy of the entire blockchain so that it can verify and validate all the blocks
2. Light Node: It only stores the block header to access a node and it is dependent on the full node. Light node is for low capacity devices which can not store the gigabytes of data
3. Archive Node: It stores everything kept in the full node and builds of archive of historical data and due to this it requires terabytes of diskspace

## Smart Contract
It is a program that runs in a ethereum blockchain network.
<br>
Since Bitcoin Script is not turing complete while solidity is turing complete, which means that in Solidity we can use loops logic and thats why we can use Smart Contract in ETH
<br>
Since we can use loops in Smart Contract and it becomes continously running block on the network due to which a hacker can enter the network. To eliminate this, the founder introduced the concept of gas, in which the programmer have to pay for the program deployment of the network and the more the number of execution in the program, the more gas the programmer have to pay. 

## Dapps (Decentralized Apps)
A Dapp is a combination of Smart Contract and Front End that runs on an decentralized network 

## Ethereum Virtual Machine (EVM)
It is a sandbox and is isolated from the other parts of the system, which means that nay operation on the EVM does not affect your system or data in any way. It is a runtime environment designed for Smart Contracts.

## Ethereum Gas
It is what the users pay to process the transactions or use smart contracts on ETH network or in general any transaction that is modifying the state of the blockchain network costs gas.

## Gas Price
The amount that the sender pays per unit gas to get the transaction mined. 
<br>
gasPrice is set by the sender.
<br>
They are denoted by gwei (1 gwei = 10^-9 ETH)
<br>
The higher the gas price, the faster the transaction will be mined.

## ETH Gas Limit
The maximum gas the transaction can consume which is set by the sender. A limit on the gas is set so as to prevent excessive use of the network and controls the spending on transaction
<br>
<br>
Total fee = Gas limit * Gas price per unit

## ETH 2.0
It introduced Scalability, Security and Sustainability
<br>
It eliminated Proof of Work (POW) and replaced it with Proof of Stake (POS).
<br>
It also eliminated the issue of scalability using the concept of Sharding
