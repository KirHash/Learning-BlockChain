// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

// Custom error message for gas efficiency
error notOwner();

contract FundMe {
    using PriceConverter for uint256;
    // Gas optimizations using constant, immutable 

    // constant used to set a variable such that it can never be changed
    uint256 public constant MIN_PRICE = 50 * 1e18;

   
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    // Variables that are set one time, but outside the same line where they are declared can be marked as "immutable"
    // immutable keywords can only be declared once in a constructor and it can not be changed later on
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MIN_PRICE, "Did not send enough");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {

        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner");
        if (msg.sender != i_owner){
            revert notOwner();
        }
        _; 
    }
    // What happens if someone sends this contract ETH without calling the fund()

    // If someone sends us money without calling the fund(), it will re route them to the fund()
    // If someone does not send enough funding, it will still get reverted  
    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }
}





