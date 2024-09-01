// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7; //Mentioning the version of the solidity is necessary
// pragma solidity >=0.8.7 < 0.9.0;
// ^ --> By the help of this, we can explain the machine that we are okay with using the mentioned version and above

// contract is similar to class that defines solidity that the next part will be about contracts
contract SimpleStorage {
    /*
        boolean: Defines true or false
        uint: Unsigned int, a whole number that isn't +ve or -ve
        int: +ve or -ve whole number
        address: an address which is a combination of numbers and alphabetic characters
        bytes: 
    */

    // bool hasFavNum = true;
    // uint256 favNum = 123; //uint8 is the lowest
    // int favNum1 = 5;
    // string favNumInText = "Five";
    // int256 favNum2 = -5;
    // address myAddress = 0xffF0281BF9f565249530a8813853886D084110Ca;
    // bytes32 favBytes ="cat"; //It is a string but automatically gets converted into bytes object; bytes2 is the lowest

    uint256 favNum; //If left uninitialized, it gets initialized by 0 in default

}