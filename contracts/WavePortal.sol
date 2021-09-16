// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint totalWaves;
    mapping (address => uint) userWaves;

    constructor() {
        console.log("This is a test smart contract");
    }
    function wave() public {
        totalWaves += 1;
        userWaves[msg.sender] += 1;
        console.log("%s is waved!", msg.sender);
    }
    function getTotalWaves() public view returns (uint) {
        console.log("We have %d total waves", totalWaves);
        return totalWaves;
    }
    function getUserWaves(address user) public view returns (uint) {
        console.log("%s has %d waves", user, userWaves[user]);
        return userWaves[user];
    }
}
