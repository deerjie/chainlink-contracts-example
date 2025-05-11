// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/**
 * @title DataFeed 喂价
 * @author cedar
 * @notice 调用chainlink的DataFeed喂价合约
 */
contract DataFeedContract {
    AggregatorV3Interface internal dataFeed;

    constructor() {
        dataFeed = AggregatorV3Interface(
		        // 喂价合约地址获取：https://docs.chain.link/data-feeds/price-feeds/addresses?page=1#sepolia-testnet
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        );
    }

    function getChainlinkDataFeedLatestAnswer() public view returns (uint256) {
        // prettier-ignore
        (
            /* uint80 roundId */,
            int256 answer,
            /*uint256 startedAt*/,
            /*uint256 updatedAt*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return uint256(answer);
    }
}