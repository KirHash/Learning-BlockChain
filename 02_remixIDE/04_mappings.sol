// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 public favNum;

    // Mapping
    mapping (string => uint256) public nameToFavNum;

    struct People { 
        uint favNum;
        string name;
    }

    struct Men {
        uint256 favNum;
        string name;
    }

    Men[] public men; 



    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    function addMen(string memory _name, uint256 _favNum) public {
        men.push(Men(_favNum, _name));
        nameToFavNum[_name] = _favNum;
    }



}

