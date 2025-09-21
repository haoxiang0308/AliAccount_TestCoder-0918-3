// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Address of the contract owner
    address payable public owner;
    
    // Event to log deposits
    event Deposit(address indexed from, uint256 amount);
    
    // Event to log withdrawals
    event Withdrawal(address indexed to, uint256 amount);
    
    // Constructor sets the owner
    constructor() {
        owner = payable(msg.sender);
    }
    
    // Function to deposit Ether into the contract
    function deposit() public payable {
        // Require that some Ether is sent
        require(msg.value > 0, "Must send some Ether");
        
        // Emit deposit event
        emit Deposit(msg.sender, msg.value);
    }
    
    // Function to withdraw all Ether from the contract
    function withdraw() public {
        // Only the owner can withdraw
        require(msg.sender == owner, "Only owner can withdraw");
        
        // Get the balance of the contract
        uint256 balance = address(this).balance;
        
        // Make sure there's something to withdraw
        require(balance > 0, "No Ether to withdraw");
        
        // Emit withdrawal event
        emit Withdrawal(msg.sender, balance);
        
        // Transfer the balance to the owner
        owner.transfer(balance);
    }
    
    // Function to get the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}