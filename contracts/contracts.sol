// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Hello {
function sayHi() public {
// 合约中的成员函数
}
function getAddress() public view returns (address) {
        return address(this);  // 返回当前合约的地址
    }
// 可支付回退函数
receive() external payable {
}
 

//  function destroyContract(address payable recipient) public {
// selfdestruct(recipient);  // 销毁合约并发送以太币
// }

// function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
//         return (type(Hello).name, type(Hello).creationCode, type(Hello).runtimeCode);
//     }
// }