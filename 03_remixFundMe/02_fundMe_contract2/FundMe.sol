// Get funds from the users
// Withdraw funds
// Set a minimum funcing value

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minPrice = 50 * 1e18;

   
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    address public owner;

    constructor() {
        // Whomever is deploying the contract is the owner
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= minPrice, "Did not send enough");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        // = --> set parameter
        // == --> equivalence parameter
        // require(msg.sender == owner, "Sender is not owner");


        // for loop
        // Starting index, ending index, step
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array to start it with a completely blank array
        funders = new address[](0);

        // withdrawing the funds and the 3 ways to do so

        // transfer; It automatically reverts 
        // Max cap of 2300 gas and if it fails it throws an error
        // msg.sender = address
        // payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance);

        // send; It will only revert if we add require statement
        // Max cap of 2300 gas and returns bool
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed!");

        // call
        // forwards all gas and returns bool
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        // call("") --> The bracket is used to put any function information 
        // The function returns two variables, bool and bytes 
        require(callSuccess, "Call failed!");
    }
   
    // Modifier
    modifier onlyOwner {
        require(msg.sender == owner, "Sender is not owner");
        _; // indicates the end or beginning of a modifier and doing rest of the code
    }
}


