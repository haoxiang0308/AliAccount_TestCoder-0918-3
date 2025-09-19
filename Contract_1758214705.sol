// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Address of the contract owner
    address payable public owner;
    
    // Event to log payments
    event PaymentReceived(address indexed from, uint256 amount);
    
    // Event to log withdrawals
    event Withdrawal(address indexed to, uint256 amount);
    
    // Constructor sets the owner
    constructor() {
        owner = payable(msg.sender);
    }
    
    // Function to deposit funds into the contract
    function deposit() public payable {
        // msg.value contains the amount of Ether sent with the transaction
        emit PaymentReceived(msg.sender, msg.value);
    }
    
    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    // Function to withdraw funds (only owner can call this)
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only owner can withdraw funds");
        require(amount <= address(this).balance, "Insufficient balance");
        
        // Transfer the specified amount to the owner
        owner.transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
    
    // Function to withdraw all funds (only owner can call this)
    function withdrawAll() public {
        require(msg.sender == owner, "Only owner can withdraw funds");
        
        uint256 balance = address(this).balance;
        owner.transfer(balance);
        emit Withdrawal(msg.sender, balance);
    }
}