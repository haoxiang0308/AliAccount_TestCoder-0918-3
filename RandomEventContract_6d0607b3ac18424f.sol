// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义一个事件
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);

    uint256 public value;

    constructor(uint256 initialValue) {
        value = initialValue;
        // 在构造函数中触发事件
        emit ValueChanged(msg.sender, 0, initialValue);
    }

    // 函数用于修改值并触发事件
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        // 触发事件
        emit ValueChanged(msg.sender, oldValue, newValue);
    }

    // 函数用于增加值并触发事件
    function increment(uint256 amount) public {
        uint256 oldValue = value;
        value += amount;
        // 触发事件
        emit ValueChanged(msg.sender, oldValue, value);
    }
}