// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// interfaces
import {ICycle} from "./ICycle.sol";


contract Cycle is ICycle {

    /* ERRORS */
    error NotAdmin(address wrongEntrant);
    error NotLegitDenomination(uint256 wrongDenomination);
    error NotCycleStateChange(uint256 currentCycleState);
    error CycleAlreadyRunning();

    /* EVENTS */
    event DenominationChanged(address indexed admin, uint256 indexed denomination);
    event CycleStarted(address indexed admin)

    uint256 public CYCLE_DENOMINATION;
    uint256 public MAX_CYCLE_DENOMINATION;

    // Returns 0 when cycle not started
    // Returns 1 when cycle is running
    // Returns 2 when cycle paused
    // Returns 3 when cycle ends
    // Returns 4 when vote counting is done
    uint256 public CYCLE_STATE;

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
    // Can not change denomination in the middle of a cycle
    function setDenomination(uint256 x) checkAdminAccess() external returns(bool){
        if(CYCLE_STATE > 0){
            revert NotCycleStateChange(CYCLE_STATE);
        }
        CYCLE_DENOMINATION = x;
        emit  DenominationChanged(msg.sender,x);
    }

    function initCycle() external checkAdminAccess() returns(bool) {
        if(CYCLE_STATE != 0){
            revert CycleAlreadyRunning();
        }
        CYCLE_STATE = 1;
    }


    /* Public functions */

    function totalStaked() public returns(uint256 a){
        assembly{
            
        }
    }



    

}
