// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract EtherWallet {
    // 可以取钱的人
    address payable public immutable owner;
    event Log(string funName,address from,uint256 value, bytes data);

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable { 
        emit Log("receive",msg.sender,msg.value,"");
    }

    function withdraw1() external  {
        require(msg.sender == owner,"not owner");
        // 发送100 到 调用者
        payable(msg.sender).transfer(100);
    }

    function withdraw2() external  {
        require(msg.sender == owner,"not owner");
        // 发送200 到 调用者 并且查看返回状态
       bool success =  payable(msg.sender).send(200);
       require(success, "Send Failed");
    }

    function withdraw3() external  {
        require(msg.sender == owner,"not owner");
        // 发送100 到 调用者
    //  (bool success,) = msg.sender.call{value: address(this).balance}("");

     (bool success,) = msg.sender.call{value: address(this).balance}("");
             require(success, "Call Failed");

    }

      function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

}