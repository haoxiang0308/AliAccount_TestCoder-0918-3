// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimplePayableContract {
    address payable public owner;
    uint256 public balance;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balance += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        uint256 amount = balance;
        balance = 0;
        owner.transfer(amount);
    }
}