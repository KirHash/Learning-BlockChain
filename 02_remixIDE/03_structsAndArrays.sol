// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 public favNum;

    // Struct
    People public person = People({favNum: 2, name: "Kirhash"});
    People private person1 = People({favNum: 5, name: "Siri"});
    People private person2 = People({favNum: 7, name: "Hitesh"});

    // Whenever we have a list of variables inside an object in solidity, it uatomatically gets indexed
    struct People { // It is used to represent a record, like a collection of favorite numbers
        uint favNum;
        string name;
    }

    // Array
    uint256 public digit;

    struct Men {
        uint256 digit;
        string name;
    }

    Men[] public men; // Dynamic array, aince the size of the array is not mentioned at array init
    // Men[3] public men; // Fixed size array


    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    // function addMen(string memory _name, uint256 _digit) public {
    //     men.push(Men(_digit, _name));
    // }

    // function addMen(string memory _name, uint256 _digit) public {
    //     Men memory newMen = Men(_digit, _name);
    //     men.push(Men(_digit, _name));
    // }

    function addMen(string memory _name, uint256 _digit) public {
        Men memory newMen = Men({digit: _digit, name: _name});
        men.push(Men(_digit, _name));
    }
}

/*
Six places to store data in solidity:
1. Stack
2. Memory
3. Storage
4. Calldata
5. Code
6. Logs

Calldata and memory means that the variable is going to exist temporarily.
In the give function on line 43, the variable _name only exists during the transaction

Storage variables exist even outside the executing function 
Storage variable favNum exist outside a function and isnt explicitly defined in one of them

Calldata variables are temporary variables that cant be modified
But memory variables are temporary variables that can be modified
Staorage variables are permanant variables that can be modified

Data location can be only used for array and structs or mapping types and since a string is an array of bytes, memory is used
*/

/*
Whenever we enter compile, it compiles it down to EVM, Ethereum Virtual Machine
EVM compatible blockchains are Avalanche, Polygon, Fantom
*/