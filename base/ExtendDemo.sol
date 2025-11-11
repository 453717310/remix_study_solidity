// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ExtendDemo{

    // solidity 可以多继承 是指派生合约能够从多个合约的继承数据和方法。 一个
    // 子合约可以有多个父合约
    // 可以通过查找is关键字来发现子合同并识别其父合同
    string public constant A_NAME = "A";

    function getName() public virtual  pure returns(string memory){
        return A_NAME;
    }


}

contract B is ExtendDemo{

    string public constant B_NAME = "B";

    function getName() public override  pure returns (string memory){
        return B_NAME;
    }
    function getName(string memory name) public pure returns (string memory){
        bytes memory n = abi.encodePacked("My name is: ",name);
        return string(n);
    }
}


contract ContractB {
    string private name = "MyContract";
    
    // 这个函数会读取状态变量，所以应该是 view
    function getNameView() public view returns (string memory) {
        return name; // 读取了状态变量
    }
    
    // 这个函数是 pure，因为它不读取也不修改状态
    function getNamePure() public pure returns (string memory) {
        return "FixedName"; // 只返回固定值，不涉及状态
    }
    
    // 这个也是 pure，只基于参数计算
    function combineNames(string memory a, string memory b) 
        public pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}


