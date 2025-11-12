// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library WeirdMath{
    int private constant factor = 100;

    function applyFactory(int self) public pure returns (int){
        return self * factor;
    }

    function add(int self,int numberToAdd) public pure returns (int){
        return self + numberToAdd;
    }
}