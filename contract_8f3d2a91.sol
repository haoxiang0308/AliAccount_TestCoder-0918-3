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
    
    // Function to deposit ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Must send some ether");
        emit Deposit(msg.sender, msg.value);
    }
    
    // Function to withdraw ether from the contract
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(address(this).balance >= amount, "Insufficient balance");
        
        owner.transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
    
    // Function to get the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    // Fallback function to receive ether
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}