// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract CrowdFunding {
    
    // 受益人
    address public immutable baneficiary;
    // 筹集目标数量
    uint256 public immutable fundingGoal;
    // 当前金额
    uint256 public  fundingAmount;
    // 资助人列表
    mapping(address => uint256) public funders;
    mapping(address => bool) private fundersInserted;
    // 资助人数量
    address[] public fundersKey;
    // 状态
    bool public AVAILABLED = true;
    // 初始化受益人，筹集目标
    constructor(address _baneficiary,uint256 _goal) {
        baneficiary = _baneficiary;
        fundingGoal = _goal;
    }

    // 资助
    // 合约关闭之后不可操作
    function contribute() external payable  {
        require(AVAILABLED, "CrowdFunding is closed");

        uint256 potentialFundingAmount = fundingAmount + msg.value;
        uint256 refundAmount = 0;
        if (potentialFundingAmount > fundingGoal){
            refundAmount = potentialFundingAmount - fundingGoal;
            funders[msg.sender] += (msg.value - refundAmount);
            fundingAmount += (msg.value - refundAmount);
        }else {
            funders[msg.sender] += msg.value;
            fundingAmount += msg.value;
        }

        if(!fundersInserted[msg.sender]){
            fundersInserted[msg.sender] = true;
            fundersKey.push(msg.sender);
        }
        if (refundAmount > 0){
            payable(msg.sender).transfer(refundAmount);
        }
    }

    function close() external returns(bool) {
        if (fundingAmount < fundingGoal){
            return false;
        }
        uint256 amount = fundingAmount;
        fundingAmount = 0;
        AVAILABLED = false;

        payable(baneficiary).transfer(amount);
        return true;
    }

    function fundersLenght() public view returns(uint256) {
        return fundersKey.length;
    }



}