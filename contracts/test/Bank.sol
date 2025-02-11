// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


/**
 所有人都可以存钱
ETH
只有合约 owner 才可以取钱
只要取钱，合约就销毁掉 selfdestruct
扩展：支持主币以外的资产
ERC20
ERC721

**/
contract Bank {

    address public immutable owner;

    event Deposit(address _ads,uint256 amount);

    event Withdraw(uint256 amount);

    event ERC20Withdraw(address from,uint256 amount);

    event ERC721Withdraw(address  indexed  token, uint256 tokenId);



    receive() external payable { 
        emit Deposit(msg.sender, msg.value);
    }

    constructor() payable  {
        owner = msg.sender;
    
    }

    // 取钱
    function winthdraw() external  {
        require(msg.sender == owner, "not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable (msg.sender));

    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    

    function withdrawERC20(address token, uint256 amount) external {
        require(msg.sender==owner, "not owner");
        IERC20 erc20 = IERC20(token);
        emit ERC20Withdraw(token, amount);

       uint256 balan = erc20.balanceOf(address(this));

       require(amount <= balan, "Insufficient ERC20 balance");
       // 发送金额到sender
       erc20.transfer(msg.sender, amount);
    }

// 提取 ERC721 代币（仅 owner 可以调用）
    function withdrawERC721(address token, uint256 tokenId) external {
        require(msg.sender == owner, "Not owner");
        IERC721 erc721 = IERC721(token);
        require(erc721.ownerOf(tokenId) == address(this), "Token not in contract");
        emit ERC721Withdraw(token, tokenId);
        erc721.safeTransferFrom(address(this), owner, tokenId); // 将 ERC721 代币发送给 owner
    }
    
}
