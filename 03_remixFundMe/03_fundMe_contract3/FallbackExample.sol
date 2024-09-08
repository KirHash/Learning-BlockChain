// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract fallbackExample {
    uint256 public result;

    // recieve()
    // It is a special function and as long as there is no data (calldata) associated with the transaction of this contract, receive function will be triggered
    receive() external payable {
        result = 1;
    }

    // fallback()
    // It is a special function that gets triggered when the calldata is defined 
    fallback() external payable {
        result = 2;
    }
}
// Since these are special functions, they dont need to have function keyword

// Explaination source: https://solidity-by-example.org/fallback/
/*
    Ether is sent to a contract
            is msg.data empty ?
                  /  \
                yes   no
                /       \
            recieve()?  fallback()
              /  \
            yes   no
       (there is  (there is
        no data)    data)
            /      \
        recieve()  fallback()

*/