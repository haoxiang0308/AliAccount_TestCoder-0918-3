// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract payableFunction {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    function() external payable {
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}