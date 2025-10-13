// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    // A payable function that accepts Ether
    function deposit() public payable {
        // Function body can be empty, or you can add logic here
        // For example, you could emit an event or update a state variable
    }

    // Function to check the balance of the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}