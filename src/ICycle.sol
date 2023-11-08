// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IMerkleTree} from "./IMerkleTree.sol";

interface ICycle is IMerkleTree {

    /*~~~~~~~~~~~~~~~~~~~~~ NOTES ~~~~~~~~~~~~~~~~~~~~* /
    // 

    /*~~~~~~ CYCLE STATE VIEWING FUNCTIONS ~~~~~~*/

    // Checks whether counting of votes is done
    // Returns red vote Count
    // Returns -1 in other case
    function redVoteCount() external;

    // Checks whether counting of votes is done
    // Returns blue vote Count
    // Returns -1 in other case
    function blueVoteCount() external;

    // Returns voteCount value anytime
    // Regardless of stage in cycles
    function totalVoteCount() external;

    // Immutable constant
    function max_denomination() external returns(uint256);

    // Immutable constant
    function max_players() external returns(uint256);

    // Returns true when address(x) has voted
    function hasVoted(address _user) external returns(bool);

    // To be set by admin while starting cycle
    // To be used in many important functions
    // Returns 0 when cycle not started
    // Returns 1 when cycle is running
    // Returns 2 when cycle paused
    // Returns 3 when cycle ends
    // Returns 4 when vote counting is done
    function cycleState() external;

    // Returns address(0) when winner not decided
    // Returns winner addres in other case
    function winnerVote() external;

    /*~~~~~~ ADMIN ADMIN ADMIN FUNCTIONS ~~~~~~*/

    // Sets denomination value to x
    // Denomination should be non-zero, less than max limit
    // Checks admin access
    // Checks whether cycle hasn't started yet
    // Returns boolean value
    function setDenomination(uint256 x) external returns(bool); 

    


    // Chekcs admin access
    // Checks whether Cycle Stake Variables are set such to start the cycle
    // 
    //
    //
    //
    // Sets cycleState to 1
    // Which is to be used to many important functions
    function initCycle() external;

    // Checks admin access
    // Checks whether 
    function pauseCycle() external;

    // Checks isOpen() first
    // Returns -1 instead when not started
    // Returns contract's ETH holding instead
    function totalStaked() external;










}