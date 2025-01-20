// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
  solidity 静态类型语言，需要指定变量类型，声明的时候都有一个默认值，
  状态变量： 变量永久存储在区块了的变量，合约存储空间
  局部变量： 函数执行中有效
  全局变量： 存储全局命名空间的变量，可以获取区块链的相关信息，比如区块链高度

**/
contract Variable {

    uint storageData // 状态变量

    constructor() public {
        storageData = 10;
    }

    function getReuslt() public returns(uint) {
        uint a = 1; // 局部变量
        address b;
        uint c = 2;
        return a + c;
    }
    // 全局变量
    // block.blockhash;
    // block.coinbase;
    // block.difficulty;
    // block.gaslimit;
    // block.number;
    // block.timestamp;
    // msg.data; // 
    // msg.sender; // 当前调用者地址
    // msg.sig; // 当前调用者签名
    // msg.value;
    // now;
    // tx.gas;
    // tx.origin



}