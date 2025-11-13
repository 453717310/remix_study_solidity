// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TimeDemo{

    // Solidity 支持直接引用以下时间单位：秒、分钟、小时、天和周。
    // 声明秒
    uint256 public second = 1 seconds;
    // 声明分钟
    uint256 public minute = 1 minutes;
    // 声明小时
    uint256 public hour = 1 hours;
    // 声明天
    uint256 public day = 1 days;
    // 声明周
    uint256 public week = 1 weeks;

    uint registrationDeadline = block.timestamp + 1 weeks;

    mapping (address => uint256) registerAddress;

    function registerVoter(address voter) public  {
        require(block.timestamp <= registrationDeadline,"registration deadline has passed.");
        
        // Register the voter
        registerAddress[voter] = block.timestamp;
    }

}