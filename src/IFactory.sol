// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IFactory {
 
    function CURRENT_CYCLE_DENOMINATION() external returns(uint256);

    function deployNewCycle(uint256 cycle_denomination, uint)
}