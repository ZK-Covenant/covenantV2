// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// interfaces
import {ICycle} from "./ICycle.sol";


contract Cycle is ICycle {

    error NotAdmin(address wrongEntrant);
    error NotLegitDenomination(uint256 wrongDenomination);

    uint256 public CYCLE_DENOMINATION;
    uint256 public MAX_CYCLE_DENOMINATION;

    mapping(address=>bool) public admin_access;
    
    modifier checkAdminAccess() {
        _checkAdminAccess(msg.sender);
        _;
    }

    function _checkAdminAccess(address user) private {
        if(!admin_access[msg.sender]){
            revert NotAdmin(msg.sender);
        }
    }

    constructor(uint256 cycle_denomination){
        CYCLE_DENOMINATION = cycle_denomination;
        admin_access[msg.sender] = true;
        
    }

    /* admin functions */
    function setDenomination(uint256 x) checkAdminAccess() external returns(bool){
        
    }

}
