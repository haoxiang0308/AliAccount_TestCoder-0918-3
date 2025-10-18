// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableContract {
    address payable public owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(address(this).balance);
    }
    
    function() external payable {
        // Fallback function to receive Ether
    }
    
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}