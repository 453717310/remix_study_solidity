// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherSendDemo{

    // 来调用目标合约：transfer、send 或 call。
    // transfer 发送失败会抛异常
    // send call 发送失败会返回 bool false

    int256 public count;

    function decrement(int num) public payable {
        count = count -num;
    }

    fallback() external payable {
        count ++;
    }

    receive() external payable {
        count +=5;
    }

}

interface IEtherSendDemo {
    function decrement(int num) external payable ;
    function nonExistentFunction() external ;
}

contract EtherSendDemoCaller{

    function callFallback(address _target) public {
        IEtherSendDemo demo = IEtherSendDemo(_target);
        demo.nonExistentFunction();
    }
}