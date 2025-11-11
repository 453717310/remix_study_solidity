// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract LinkBasicToken{


    mapping ( address => uint256 ) public balances;

    string[6] public  strArray = ["a","b","c","d","e","f"];
    uint[6] public  uintArray ;
    uint[] public  uintArrayDynamic;
    

    function transfer(address _to, uint256 _value) public returns (bool) {
        balances[msg.sender] -= (_value);
        balances[_to] += (_value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function test01(mapping(address => uint256) storage test) internal  returns (bool) {
        test[msg.sender] += 1;
        return true;
    }

    // 映射不支持作为参数传递给函数，除非函数可见性被标记为internal 因此 你无法编写接受键值对作为参数
    // 的外部或公共可调用函数

    /*
    如何在Solidity中的两种主要数组类型是固定大小数组和动态大小数组
    固定大小数组是声明时指定大小的数组，而动态大小数组是可以在运行时动态调整大小的数组。
    固定大小数组的语法是 uint[2] fixedArray，其中2是数组的大小。动态大小数组的语法是 uint[] dynamicArray。
    固定大小数组的大小在声明时就已经确定，不能在运行时更改。动态大小数组的大小可以在运行时动态调整，
    可以使用push()方法向数组中添加元素，使用pop()方法从数组中移除最后一个元素。
    固定大小数组的元素可以通过索引访问，例如fixedArray[0]访问第一个元素。动态大小数组的元素也可以通过索引访问，
    例如dynamicArray[0]访问第一个元素。

    固定大小数组的大小必须是常量表达式，不能是变量。动态大小数组的大小可以是变量。
    固定大小数组的元素必须是相同类型，动态大小数组的元素也必须是相同类型。
    固定大小数组的元素可以是任何类型，包括结构体和映射。动态大小数组的元素也可以是任何类型，包括结构体和映射。
    固定大小数组的元素可以是另一个数组，动态大小数组的元素也可以是另一个数组。
    */
    function fixedArray() public {
      uintArray[0] = 1;
      uintArray[1] = 2;
      uintArray[2] = 3;
      uintArray[3] = 4;
      uintArray[4] = 5;
      uintArray[5] = 6;

    }
    function dynamicArray() public {
       uintArrayDynamic.push(1);
       uintArrayDynamic.push(2);
       uintArrayDynamic.push(3);
       uintArrayDynamic.push(4);
       uintArrayDynamic.push(5);
       uintArrayDynamic.push(6);
    
    
       // 删除最后一个
       uintArrayDynamic.pop();

       // 删除指定的位置
       delete uintArrayDynamic[3];
    }

    function inMemArray(string memory firstName, string memory lastName)
        public
        pure
        returns (string[] memory)
    {

        // 在 memory 中创建一个长度为 2 的固定大小数组
        string[] memory arr = new string[](2);
        arr[0] = firstName;
        arr[1] = lastName;
        return arr;
    }

    // 函数修饰符(function modifier) 是什么


}