// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


library SafeMath {
    
    function addmod(uint x, uint y)internal pure returns(uint) {
        uint c = x + y;
        require(c >= x, "SafeMath: addition overflow");
        return c;
    }
}

contract addTest {
    function add(uint x,uint y) public pure returns(uint) {
        return SafeMath.addmod(x, y);
    }
}