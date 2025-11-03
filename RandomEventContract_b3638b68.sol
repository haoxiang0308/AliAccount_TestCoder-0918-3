// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventContract {
    // 定义事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    
    // 存储变量
    mapping(address => uint256) public balances;
    
    constructor() {
        balances[msg.sender] = 1000;
    }
    
    // 触发Transfer事件的函数
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _value);
    }
    
    // 触发Approval事件的函数
    function approve(address _spender, uint256 _value) public {
        // 触发Approval事件
        emit Approval(msg.sender, _spender, _value);
    }
    
    // 触发LogMessage事件的函数
    function logSomething(string memory _message) public {
        // 触发LogMessage事件
        emit LogMessage(_message, block.timestamp);
    }
    
    // 一个更复杂的示例，包含多个事件触发
    function complexOperation(address _to, uint256 _value, string memory _note) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // 同时触发多个事件
        emit Transfer(msg.sender, _to, _value);
        emit LogMessage(_note, block.timestamp);
        emit Approval(msg.sender, _to, _value / 2); // 假设授权一半金额
    }
}