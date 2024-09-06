// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathTester {
    // Before the 0.8 version of solidity, unsigned int and int ran on the concept of being unchecked
    // This means that whenever an int or uint passses the upper limit then it would start back from the lowest number
    uint8 public bigNum = 255; 

    function add() public {
        // bigNum = bigNum + 1;
        unchecked {bigNum = bigNum + 1;}
    }
}