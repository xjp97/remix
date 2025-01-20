// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


interface IToken {
    
    function transfer(address recipient,uint256 amount) external;
}

contract SimpleToken is IToken {

     mapping(address => uint256) public balances;
     constructor() {
        balances[msg.sender] = 1000;  // 初始化代币余额
    }

    function transfer(address recipient,uint256 amount) public override{
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    } 

    function getSelectorDuble() external pure returns(bytes4) {
        return this.transfer.selector;
    }
    
}

contract Award {
    IToken immutable token;
    // 构造函数中传入 SimpleToken 合约的地址
    constructor(IToken _token) {
        token = _token;
    }
    // 调用 SimpleToken 合约的 transfer 函数来发送奖励
    function sendBonus(address user) public {
        token.transfer(user, 100);  // 向用户发送100个代币作为奖励
    }
}