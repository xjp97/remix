

/**
  没有浮点类型
  值类型
  布尔类型
  整形
  定长类型
  定长字节数组
  有理数和整型常量
  字符串常量
  十六进制常量
  枚举
  函数类型
  地址类型
  地址常量
**/
// 引用类型

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ValueType {
    //布尔类型
    bool public isActive = true;

    function toggleActive() public {
        isActive = !isActive;
    }

    //整形
    int8 signedInt = 32; //-2^8 -1 ----- 2^8 -1
    // 无符号整型
    uint8 uInt = 32; // 0---2^8 -1
    // 模拟定长浮点数
    int256 fixedPoint = 1E18;
    // 定长字节数据
    bytes1 sigleByte = 0x12;

    int8 a = -1;
    int16 b = 2;
    uint32 c = 10;
    uint8 d = 16;

    function add(uint x,uint y) public pure returns(uint z) {
        z = x +y;
    }

    function divide(uint x,uint y) public pure returns(uint z) {
        z = x / y;
    }

    function shift(int x,uint y) public pure returns(int z) {
        z = x >> y;
    }

    function add2() public  pure returns(uint8) {
        uint8 i = 240;
        uint8 j = 16;
        uint8 k = i +j;
        return k;
    }




    // 有理数和整型常量
    uint256 integer = 1234;
    // 表示 1.5 以太
    uint256 rationalLitecal = 1.5 * 1e18;

    // 字符串常量 不可变文本文具
    string greeting = "hello";

    // 枚举
    enum Status {Pending,Shipped}

    Status public  currentStatus;
    // 函数类型
    function setStatus(Status _status) public {
        currentStatus = _status;
    }

    // 地址类型 存储以太坊的地址，20 个字符
    address owner = msg.sender;

    //属性获取地址的以太坊余额
    uint256 balance = owner.balance;

    // payable 表示地址可以接收以太
  //  address payable payableAddress = payable(owner);  // 将 address 转换为 address payable

    address payable recipient = payable(0x1234567890123456789012345678901234567890);

    // recipient.transfer(1 ether);

    // bool success = recipient.send(1 ether);  // 转移 1 ETH，返回成功与否
    // require(success, "Transfer failed.");


    // 地址常量
    address constant fiexdAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    address public myAddress2 = msg.sender;



    if (myAddress == myAddress2){

    }else {

    }


}