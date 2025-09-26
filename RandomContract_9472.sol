// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomContract_9472 {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    function() external payable {
        // This is the fallback function, making the contract accept ETH
    }
}