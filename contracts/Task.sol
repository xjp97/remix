// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Task {
    
    function execute(address target, uint value, bytes memory data) public payable returns (bytes memory){
        (bool success, bytes memory returnData) = target.call{value:value}(data);
        require(success, "execute: Transaction execution reverted."); 
        return returnData; 
    }

}