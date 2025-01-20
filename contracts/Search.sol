// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Search {
    
    function indexOf(uint[] storage self,uint value) public view returns(uint) {
        for(uint i = 0; i < self.length; i++){
            if (self[i] == value) return i;
        }
        return uint(500);
    }
}