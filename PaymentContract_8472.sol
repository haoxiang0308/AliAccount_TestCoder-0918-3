// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentContract {
    address payable public owner;
    uint256 public totalReceived;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    receive() external payable {
        totalReceived += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}