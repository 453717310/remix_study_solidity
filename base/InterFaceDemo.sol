// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ITarget {
    function decrement() external;
    function getCount() external view returns (uint256);
}

contract Target  {
    uint256 private _count;
    
    constructor(uint256 initialCount) {
        _count = initialCount;
    }
    
    function decrement() external  {
        require(_count > 0, "Count is already zero");
        _count--;
    }
    
    function getCount() external view  returns (uint256) {
        return _count;
    }
}

contract TargetCaller {
    event DecrementCalled(address target);
    
    function callDecrement(address _address) external  returns (bool){
        ITarget target = ITarget(_address);
        target.decrement();
        emit DecrementCalled(_address);
        return true;
    }
}