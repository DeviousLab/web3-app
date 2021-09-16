// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint totalWaves;
    mapping (address => uint) userWaves;

    event NewWave(address indexed from, uint timestamp, string message);
    struct Wave {
        address waver;
        string message;
        uint timestamp;
    }
    Wave[] waves;

    constructor() payable {
        console.log("This is a test smart contract");
    }
    function wave(string memory _message) public {
        totalWaves += 1;
        userWaves[msg.sender] += 1;
        console.log("%s is waved with message: %s!", msg.sender, _message);
        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);

        uint prizeAmount = 0.0001 ether;
        require(prizeAmount <= address(this).balance, "Insufficient funds");
        (bool success,) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to send ether");
    }
    function getAllWaves() view public returns (Wave[] memory) {
        return waves;
    }
    function getTotalWaves() public view returns (uint) {
        return totalWaves;
    }
    function getUserWaves(address user) public view returns (uint) {
        console.log("%s has %d waves", user, userWaves[user]);
        return userWaves[user];
    }
}
