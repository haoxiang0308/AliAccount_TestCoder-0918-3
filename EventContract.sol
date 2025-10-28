// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // Define events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    
    // Simple state variables for demonstration
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;
    
    constructor() {
        balances[msg.sender] = 1000;
    }
    
    // Function that triggers Transfer event
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // Emit Transfer event
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    // Function that triggers Approval event
    function approve(address _spender, uint256 _value) public returns (bool) {
        allowance[msg.sender][_spender] = _value;
        
        // Emit Approval event
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }
    
    // Function that triggers a custom LogMessage event
    function logSomething(string memory _message) public {
        emit LogMessage(_message, block.timestamp);
    }
    
    // Function to get current balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}