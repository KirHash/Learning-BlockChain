// Get funds from the users
// Withdraw funds
// Set a minimum funcing value

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minPrice = 50 * 1e18;

    // Array, structs and mappings
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // to get how much value someone is sending
        // require(msg.value > 1e18, "Did not send enough");
        // require(getConversionRate(msg.value) >= minPrice, "Did not send enough");
        require(msg.value.getConversionRate() >= minPrice, "Did not send enough");
        // 1e18 = 1 * 10**18 = 1000000000000000000 gwei
        // require is a checker keyword. If it doesnt satisfy the requirement, then it is reverted; which means that it undoes any action before and sends the remaining gas back. 

        // Keeps track of whoever is making a transaction
        // msg.sender returns the sender's address of the current call
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] = msg.value;
    }
    // In order to get the value that is outside the blockchain, we use decentralized Oracle network to get the price of one ether in terms of mentioned currency
    // The oracle problem (the variables or random data are added using API calls to the nodes. Different nodes will get different results and the consenus will never be reached) can be solved using blockchain oracle
    // Blockchain Oracle is any device that interacts with the off chain world to provide external data or computation to the smart contracts 

    // Chainlink is used to elimate the issue of centralized node for making API calls or computation, a decentalized Oracle Network which can be customized to deliver external data or computation
    // Chainlink Data Feeds: A network of chainlink nodes gets data from different exchanges and data providers and brings that data through a network of decntralized chain link nodes.
    // The chain link nodes uses median to figure the actual price of the asset, then deliver it in a single transaction called reference contract or data contact.
    // Then user contact uses reference contract for pricing info to power DeFi apps
    // Chainlink Verifiable Random Dysfunction(VRF): They are used to get provably random numbers from real world into the smart contract
    // Chainlink Keepers: They are listening nodes that listens to registration contract for different events that user specify to fire or execute. Once the trigger returns true, the chain link will do as told
    // End-to-end reliability: Chainlink nodes can make direct request to the API calls 

   
}


