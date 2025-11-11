// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/*
智能合约中的变量有3个作用域
1.状态变量：通过将值记录在区块链上，在智能合约中存储永久数据（称为持久状态）。
2.局部变量：这些是“暂时性”数据，在运行计算时会在短时间内保存信息。这些值
不会永久存储在区块链上。
3.全局变量：这些变量和函数由Solidity“注入”到您的代码中，无需专门创建
或从任何地方导入他们即可使用。这些提供了代码运行时的区块链环境信息，还包括程序中会
用到的功能性函数。

也可以这样理解
1.状态变量通常位于智能合约内部，但位于函数外部。
2.局部变量通常位于函数内部，并且只能在函数内部使用。
3.全局变量是由Solidity提供的，可以在任何地方使用。
*/

contract HotFudgeSauce{
    //uint 数据类型  public 可见性修饰符  qtyCups 状态变量名称
    uint public qtyCups;// 状态变量
    // constant 修饰常量 声明记赋值 只赋值一次 不能改变
    string constant TEXT = "ABC";
    // immutable 修饰状态变量 只赋值一次，一般通过构造赋值
    address immutable owner ;

    // constant 的值必须在代码本身中硬编码（hardcode），
    // 而immutable 
    // 变量可以将它们的值设置一次，通常是通过构造函数中的赋值
    constructor(){
        owner = msg.sender; // 全局变量
    }

    // 获得当前 hot fudge 的数量 view 状态可变性修饰符(仅读取状态变量)
    // returns(uint) 返回值类型
    function get() public view returns(uint){
        return qtyCups;
    }

    // 将hot fudge 的数量加一的函数
    function increment() public {
        qtyCups += 1;
    }

    // 将hot fude 的数量减一的函数
     function decrement() public {
        require(qtyCups > 0, "no more hot fudge sauce left!");
        qtyCups -= 1;
        // 当qtyCups = 0 会revert
    }
// 可见度类型
// 在Solidity中有4种不同类型的可见性：public external internal 和 private
/*
1. public 任何人都可以访问
2. external 只能从外部访问（即，不能从合约内部访问）
3. internal 只能从内部访问（即，不能从其他合约或通过交易访问）
4. private 只能从当前合约内部访问，不能从派生合约访问
*/

}