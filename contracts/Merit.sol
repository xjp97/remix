// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/introspection/IERC1820Registry.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777Recipient.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777.sol";


contract Merit is IERC777Recipient {
    
    mapping(address => uint) public givers;
    address _owner;
    IERC777 _token;
    IERC1820Registry private _erc1820 = IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24);
    bytes32 constant private TOKENS_RECIPIENT_INTERFACE_HASH = 0xb281fc8c12954d22544db45de3159a39272895b169a852b314f9cc762e44c53b;
    constructor(IERC777 token) {
         _erc1820.setInterfaceImplementer(address(this), TOKENS_RECIPIENT_INTERFACE_HASH, address(this));
        _owner = msg.sender;
        _token = token;
    }

    function tokensReceived(address operator,address from,address to,uint amount,  
        bytes calldata userData,
        bytes calldata operatorData) external {
        givers[from] += amount;
    }

    function  withdraw() external  {
        require(msg.sender == _owner, "no permission");
        // 返回当前账号的代币数量
        uint balance = _token.balanceOf(address(this));
        // 发送代币
        _token.send(_owner, balance, "");
    }

}