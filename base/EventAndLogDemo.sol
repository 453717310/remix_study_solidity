// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SinpleStorage{

    uint256 favoriteNumber;

    // 任何具有 indexed 关键字的数据都由 EVM 索引，
    // 使得对区块链日志的查询可以使用索引参数作为过滤器，
    // 会让日志的检索速度更快。
    // 一个事件最多可以存储 4 个索引参数
    event storedNumber(
        uint256 indexed oldNumber,
        uint256 indexed newNumber,
        uint256 addedNumber,
        address sender
    );

    function store(uint256 newNumber) public {
        emit storedNumber(
            favoriteNumber,
            newNumber,
            newNumber + favoriteNumber,
            msg.sender
        );
        favoriteNumber = newNumber;
    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}