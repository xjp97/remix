// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract SimpleWallet {
    
    mapping(address => uint256) public balances;

    address constant onwer = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function deposit() public payable  {
        balances[msg.sender] += msg.value;
    }


    function withdraw(uint256 amount) public {
        if(msg.sender != onwer){
          require(false, "onwer not no");
        }
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

}