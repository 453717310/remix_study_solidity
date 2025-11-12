// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {WeirdMath} from "./LibraryDemo.sol";

contract LibraryStrangeMath{


    function multiplyWithFactor(int num) public pure returns (int){
        return WeirdMath.applyFactory(num);
    }

    using WeirdMath for int;

    function addTwoNums(int num1,int num2) public pure returns (int){
        return num1.add(num2);
    }

}