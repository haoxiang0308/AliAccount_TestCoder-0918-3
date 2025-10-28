// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    event UserAction(address indexed user, string action, uint256 amount);

    // 存储余额
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000;
    }

    // 触发Transfer事件
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _value);
    }

    // 触发LogMessage事件
    function logMessage(string memory _message) public {
        emit LogMessage(_message, block.timestamp);
    }

    // 触发UserAction事件
    function performAction(string memory _action, uint256 _amount) public {
        // 触发UserAction事件
        emit UserAction(msg.sender, _action, _amount);
    }
    
    // 获取余额
    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }
}