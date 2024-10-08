// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts@1.2.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns(uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = dataFeed.latestRoundData();
        return uint256(answer * 1e10); // 1**10
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return dataFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInCurrency = (ethPrice * ethAmount) / 1e18;
        return ethAmountInCurrency;
    }
}
