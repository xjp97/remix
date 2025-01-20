// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract controlTest {
    function testWhile() public pure returns (uint) {
uint i = 0;
uint sumOfOdd = 0;
while (true) {
i++;
if (i % 2 == 0) {
continue;          // 跳过偶数
}
if (i > 10) {
break;             // 终止循环
}
sumOfOdd += i;
}
return sumOfOdd;            // 返回奇数和
}
function testFor() pure public returns (uint, uint) {
uint sumOfOdd = 0;
uint sumofEven = 0;
for (uint i = 0; i < 10; i++) {
if (i % 2 == 0) {
sumofEven += i;   // 累加偶数
} else {
sumOfOdd += i;    // 累加奇数
}
}
return (sumOfOdd, sumofEven);  // 返回奇数和与偶数和
}


function tryCatchDemo(address _contractAddress) public {
// 尝试调用外部合约的函数
try ExternalContract(_contractAddress).someFunction() returns (bool result) {
    
// 处理成功
} catch {
// 处理失败
}
}
}
contract ExternalContract {
function someFunction() public returns (bool) {
// 可能抛出异常的函数
}

}