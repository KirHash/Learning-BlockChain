const { ethers } = require("hardhat");
const {  expect, assert } = require("chai");

/*
describe("SimpleStorage", function() {

    beforeEach()

    it()
    it()
    it()

    describe("SimpleStorage", function() {

    beforeEach()

    it()
    it()
    it()

    })
})
*/


describe("SimpleStorage", () => {
    // let simpleStorageFactory;
    // let simpleStorage;
    let simpleStorageFactory, simpleStorage;
    beforeEach(async function () {
        simpleStorageFactory = await ethers.getContractFactory(
            "SimpleStorage"
        )
        simpleStorage = await simpleStorageFactory.deploy();
    }) // its gonna tell what to do before each test

    it("Should start with a favourite number of 0", async function () {
        const currVal = await simpleStorage.retrieve();
        const expectedVal = "0";
        // expect
        // assert
        assert.equal(currVal.toString(), expectedVal)
        // expect(currVal.toString()).to.equal(expectedVal)
    })
    it("Should update when we call store", async function () {
        const expectedVal = "7"
        const transactionResponse = await simpleStorage.store(expectedVal)
        await transactionResponse.wait(1)

        const currVal = await simpleStorage.retrieve()
        assert.equal(currVal.toString(), expectedVal)
    })

})


// To run only a specific it() function, `yarn hardhat test --grep store`
// it.only() can also run specific it() function
