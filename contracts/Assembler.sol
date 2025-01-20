// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Assembler {
    
    function do_something_cpu() public  {
        assembly {

        }
    }

    function addAssembly(uint x, uint y) public pure returns (uint){
     assembly { 
       let result := add(x, y) // x+y 
       mstore(0x0, result) // 在内存中保存结果 
        return(0x0, 32) // 从内存中返回 32 字节 
} 
} 
function addSolidity(uint x, uint y) public pure returns (uint){return x + y; 
}


    function localvar() public pure {
        uint b = 5;
        assembly{
            let x := add(2,3)
            let y:= mul(x,b)
            let z := add(x,y)

        }

    }
    function forloop(uint x,uint y) public pure returns(uint ) {
        assembly{
            for{let i :=0} lt(i,x) {i := add(i,1)} {
                y := add(2,y)
            }
            mstore(0x0,y)
            return (0x0,32)
        }
        
    }

    function ifLoop(uint x,uint y) public pure returns(uint ){
        // assembly{
        //     if slt(x,0) {
        //         x := sub(0,x)
        //     }
        //     if eq(y,0) revert(0,0);
        // }

        assembly { function f() -> a, b {} 
let c, d := f() 
}
    }


    
}