// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Used to import other contracts in 
import "./SimpleStorage.sol";

contract StorageFactory {
    // Everytime we call the func createSimpleStorageContract, it replace whatever is inside impleStorage
    // SimpleStorage public simpleStorage;

    // So the SimpleStorage is updated to an Array to keep a running list of variables in the contract in blockchain
    SimpleStorage[] public simpleStorageArray;
    // If "Array of SimpleStorage" was just an array of address of contract objects, then we would have to wrap "simpleStorageArray[_simpleStorageIndex]" into SimpleStorage


    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);

    }
    // To call func store from StorageFactory
    function storageFactoryStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // In order to interact with any contract, one needs:
        // Address
        // ABI - Application Binary Interface, it tells exactly how we can interact with our contract
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // simpleStorage.store(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function storageFactoryGet(uint256 _simpleStorageIndex) public view returns (uint256){
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.retrieve();
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }

}
    
/*
The StorageFactory contract allows us to create createSimpleStorageContract
Then it saves it to simpleStorageArray, which can be used to call on different functions.
It is used to store values (storageFactoryStore) and read values (storageFactoryGet)
*/