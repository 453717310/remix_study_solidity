// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {C} from "./ExtendDemo01.sol";

contract E is C {
    constructor(){
        author = "Hemingway";
    }

    function getAuthor() public override view  returns (string memory){
        return author;
    }
}


contract ParentOne{
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}

contract ParentTwo{

    address public owner;

    constructor(address _owner){
        owner = _owner;
    }
}

contract ChildOne is 
                    ParentOne("caiwei"),
                    ParentTwo(0x208AA722Aca42399eaC5192EE778e4D42f4E5De3){

}


contract ChildTwo is ParentOne, ParentTwo{
    constructor(string memory _name,address _address)
        ParentOne(_name)
        ParentTwo(_address)
    {}

    

}
                    
