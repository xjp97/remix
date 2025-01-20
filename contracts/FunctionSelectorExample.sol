pragma solidity ^0.8.0;

contract FunctionSelectorExample {

    // 函数：计算输入值的平方
    function square(uint x) public pure returns (uint) {
        return x * x;
    }
    // 函数：计算输入值的两倍
    function double(uint x) public pure returns (uint) {
        return 2 * x;
    }

    function getSelectorSquare() external pure returns(bytes4) {
        return this.square.selector;
    }

     function getSelectorDuble() external pure returns(bytes4) {
        return this.double.selector;
    }

    function getSelectorDuble2() external pure returns(bytes4) {
        return bytes4(keccak256("double(uint256)"));
    }
   
    function excute(bytes4 selector,uint x) public returns (uint) {
         (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
    require(success, "Call failed");
    return  abi.decode(data, (uint));
    }

    
}