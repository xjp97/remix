// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TipJob {

    address public owner;


    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"aaa not owner");
        _;
    }

    function tip() public payable  {
        require(msg.value > 0 , "you should send a tip to use this function");
    }

    function withdraw() public {
        uint256 con =  address(this).balance;
        require(con > 0 , "withdraw you should send a tip to use this function");
        payable(owner).transfer(con);
    }


    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

}