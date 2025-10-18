// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // Define events
    event ValueChanged(address indexed author, uint oldValue, uint newValue);
    event Transfer(address indexed from, address indexed to, uint value);
    event LogMessage(string message, uint timestamp);

    uint public value;
    mapping(address => uint) public balances;

    constructor(uint initialValue) {
        value = initialValue;
        emit ValueChanged(msg.sender, 0, initialValue);
    }

    function setValue(uint newValue) public {
        uint oldValue = value;
        value = newValue;
        emit ValueChanged(msg.sender, oldValue, newValue);
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        balances[to] += amount;
        
        emit Transfer(msg.sender, to, amount);
        emit LogMessage("Transfer completed", block.timestamp);
    }

    function deposit(uint amount) public {
        balances[msg.sender] += amount;
        emit LogMessage("Deposit received", block.timestamp);
    }
}