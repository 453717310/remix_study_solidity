// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ExceptionDemo{

    // 异常处理 - require/assert/revert
    function testRequire(uint _i) public pure {
        // require语句检查指定的是布尔条件，如果为假，它将抛出错误
        require(_i > 10, "The input number must be greater than 10.");
    }

    // assert
    function testAssert(uint _i) public pure {
        // assert语句检查指定的布尔条件，如果为假，则会抛出异常
        assert(_i > 10);
    }

     // revert
    function testRevert(uint _i) public pure {
        // revert语句会终止执行并回滚状态更改
        if (_i > 10) {
            revert("The input number must be less than or equal to 10.");
        }
    }
     // 自定义异常
    error InsufficientBalance(uint balance, uint withdrawAmount);
    function testCustomError(uint _i) public view  {
        if (_i > 10) {
            revert InsufficientBalance(address(this).balance, _i);
        }
    }

}