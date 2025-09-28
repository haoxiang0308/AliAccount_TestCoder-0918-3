// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PayableContract_1 {
    address payable public owner;
    uint256 public balance;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw.");
        owner.transfer(address(this).balance);
    }

    receive() external payable {
        deposit();
    }
}