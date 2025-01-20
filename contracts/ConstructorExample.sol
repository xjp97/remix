// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ConstructorExample {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    event DataChanged(uint newValue);
    uint public data;
    function setData(uint _data) public {
        data = _data;
        emit DataChanged(_data);  // 触发事件
    }

    
}