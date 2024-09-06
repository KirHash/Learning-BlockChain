// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts@1.2.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// Libraries are similar to contracts, but you cant declare any state variable and you can not send ether, it is embedded into a contract if all library functions are internals otherwise it needs to be deployed before the contract is deployed.
library PriceConverter {
     // function to get the price from the function fund in terms of given real world currency
    function getPrice() internal view returns(uint256) {
        // ABI
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = dataFeed.latestRoundData();
        // ETH in terms of mentioned currency
        return uint256(answer * 1e10); // 1**10
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return dataFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        // Always multiply before dividing
        uint256 ethAmountInCurrency = (ethPrice * ethAmount) / 1e18;
        return ethAmountInCurrency;
    }
}