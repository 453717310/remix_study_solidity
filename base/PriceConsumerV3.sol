// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
// import 将现有代码导入我们的智能合约
contract PriceConsumerV3{

    AggregatorV3Interface internal priceFeed;

    constructor(){
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function getLatestPrice() public view  returns (int){
        (,int price,,,) = priceFeed.latestRoundData();
        return price;
    }

}

/*
状态可变性关键字（修饰符：modifier）
constant 状态变量 变量在编译时就知道它的值，所以它的值也会被编码进合约的字节码中。

immutable  状态变量  变量的值在部署时就知道了，所以它的值也会被编码进合约的字节码中。

view  方法  只读方法，不改变区块链的状态

pure 方法  不读取也不写入区块链的状态，只是进行计算

payable 方法  可以向地址发送ether

virtual 方法  可以被子合约重写

override 方法  重写父合约中的方法

indexed 事件参数  可以被索引，用于过滤事件

anonymous 事件  不会被记录到区块链中，只能通过合约地址查询

数据存储类型 – storage/memory/stack

storage  状态变量  存储在区块链中，可以被多个函数访问

memory  方法参数  存储在内存中，只能被当前函数访问

stack  方法参数  存储在栈中，只能被当前函数访问


Solidity 数据类型
int  有符号整数
uint 无符号整数
bool 布尔值
array 数组
mapping 映射
string 字符串
bytes 字节
address 地址

*/


