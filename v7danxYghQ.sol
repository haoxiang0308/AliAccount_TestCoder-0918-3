// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableContract {
    address payable public owner;
    uint256 public balance;

    constructor() {
        owner = payable(msg.sender);
    }

    // Payable function that allows the contract to receive Ether
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balance += msg.value;
    }

    // Function to withdraw funds - only owner can call this
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = balance;
        balance = 0;
        owner.transfer(amount);
    }

    // Function to get the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Fallback function to receive Ether
    receive() external payable {
        balance += msg.value;
    }

    // Fallback function
    fallback() external payable {
        balance += msg.value;
    }
}