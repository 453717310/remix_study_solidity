// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHotFundgeSauce {

    function get() external view returns(uint);

    function increment() external ;

    function decrement() external ;
    
}

contract HotFundgeSauce is IHotFundgeSauce{

    uint private _count; // internal variable to store the count
    event CountUpdated(uint newCount); // event to log count updates

    function get() external view returns(uint){

    }
     function increment() external {

     }
     function decrement() external {
        _count--;
        emit CountUpdated(_count);
    }

}
/*
抽象合约是使用abstract关键字声明的，合约中声明了一个或多个函数但未实现的函数。
或者使用另一种定义，至少有一个函数已声明单未实现

抽象合约可以有其实现的函数(不像接口不能有函数实现)，但只要有一个函数未实现，
合约就必须标记为抽象的：

抽象合约不能直接实例化(创建)。他们只能被继承，继承他的合约可以使用它的函数。

*/ 

abstract contract HotFundgeSauceProxy {

    int public age;

    // 如果一个函数没有实现，它必须被标记为virtual，这样子合约才能覆盖它。
    function utterance() public virtual returns(bytes32);

    function setAge(int _age) public {
        age = _age;
    }
}
/*
接口和抽象合约之间的一些重要区别是：
1. 接口中不能有实现函数，而抽象合约可以有任意数量的函数实现，但是至少有一个
函数时“抽象的”}（即未实现）。
2. 接口中的所有函数都必须标记为“external”,因为他们只能由实现该接口的其它合约
调用
3. 接口不能有构造函数，而抽象合约可以有。
4. 接口不能有变量，而抽象合约可以有。
*/