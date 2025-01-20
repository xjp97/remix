// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SafeMath.sol";
import "./Search.sol";


contract addTest2 {
    using SafeMath for uint;

    using Search for uint[];

    uint[] data;

    function push(uint value) public  {
        data.push(value);
    }

    function replace(uint _old,uint _new) public  {
        uint index = data.indexOf(_old);
        if(index == uint(500)){
            data.push(_new);
        }else {
            data[index] = _new;
        }
    }

    function add(uint x,uint y) public pure returns(uint) {
        return x.addmod(y);
    }
}