pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MyToken is ERC20("","") {

    using SafeMath for uint256; 

    constructor() {
     _mint(msg.sender, 1000 * 10 ** 18);  // 初始化账户，给合约部署者 1000 代币
}

function checkBalance(address account) public view returns (uint256) {
return balanceOf(account);  // 返回指定账户的代币余额
}

    function sendToken(address token,uint256 _amount) public returns (bool){
        return transfer(token,_amount);
    }

}