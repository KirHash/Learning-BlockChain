// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7; 

contract SimpleStorage {
    uint256 public favNum;

     function store(uint256 _favNum) public {
        favNum = _favNum;
        favNum += 1; // The more stuff you do in a contract, the more gas it requires
        retrieve(); // This will cost gas since the contract has to read it
     }

    // Gas is only spent when there is a change in state of the blockchain

    // view and pure do not use gas at all
    // They disallow modification of the state
    // view: It just reads state of the contract, it doesnt update the blockchain
    // pure: It disallows reading from the blockchain
    function retrieve() public view returns(uint256){
        return favNum;
    }

    function add() public pure returns(uint256){
        return (1 + 1);
    }
}
// 0xd9145CCE52D386f254917e481eB44e9943F39138

/*
Function Visibility Specifiers:

1. public: Can be accessed globally
2. private: Specific block can access
3. external: Only accessed from outside the function
4. internal: Can only be accessed by the function name 
*/