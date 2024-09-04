// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


// Inheritance of SimpleStorage.sol
contract ExtraStorage is SimpleStorage {
    
    // Overriding functions using two keywords virtual and override
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
   


}