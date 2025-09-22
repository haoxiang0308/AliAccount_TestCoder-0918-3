// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Event to log payments
    event PaymentReceived(address indexed from, uint256 amount);
    
    // Owner of the contract
    address public owner;
    
    // Constructor sets the owner
    constructor() {
        owner = msg.sender;
    }
    
    // Payable function that can receive Ether
    function deposit() public payable {
        // Emit an event when payment is received
        emit PaymentReceived(msg.sender, msg.value);
    }
    
    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    // Function to withdraw all funds (only owner)
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }
}