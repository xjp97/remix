// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Counter {
    uint conter;

    constructor() {
        conter = 0;
    }
    function count(uint a) public  {
        conter += a;
    }

    function get(uint a) public view returns (uint) { 
      return conter+a; 
    } 

    function getSelectorGet() external pure returns(bytes4) {
        return bytes4(keccak256("get(uint)"));
    }

        function getSelectorCount() external pure returns(bytes4) {
        return bytes4(keccak256("count(uint)"));
    }
}