// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RandomContract_8927 {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    function() external payable {
        // This is the fallback function which is payable
    }
}