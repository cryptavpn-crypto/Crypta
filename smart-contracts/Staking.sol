// SPDX-License-Identifier: MIT
// Copyright (c) 2025 cryptavpn-crypto
// Project: CRYPTA
// All rights reserved.

pragma solidity ^0.8.0;

contract Staking {
    // Mapping of staker address to amount staked
    mapping(address => uint256) public stakes;

    function stake() public payable {
        stakes[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(stakes[msg.sender] >= amount, "Insufficient balance");
        stakes[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
