// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringBytes{


    struct Person{
        string name;
        uint age;
        bool isSolidityDev;
        Job job;
    }

    struct Job{
        string employer;
        string department;
        bool isRemote;
    }

    // Job 结构体是没有初始化的
    Person public person = Person({
        name: "Alice",
        age: 20,
        isSolidityDev: true,
        job: Job("", "", false)
    });

    address owner ;

    // 传入字符串 返回字节
    function stringToBytes(string memory _str) public pure returns(bytes memory){
        return bytes(_str);
    }

     // 传入字节 返回字符串
    function bytesToString(bytes memory _bytes) public pure returns(string memory){
        return string(_bytes);
    }

    //创建一个存款功能
    function deposit() public payable {
        // 将 msg.value 存入 payable(地址)
        payable(msg.sender).transfer(msg.value);
    }

     // 创建一个提款功能
    function withdraw(uint256 _amount) public {
        // 将 _amount 提取到 msg.sender
        payable(msg.sender).transfer(_amount);
    }

     // 创建一个查看余额的功能
    function getBalance() public view returns (uint256) {
        // 返回合约的余额
        return address(this).balance;
    }

    // 创建一个退款功能

    function refund() public payable {
        // 将 msg.value 退款到 msg.sender
    
        // 将 msg.value 退款到 msg.sender
        payable(msg.sender).transfer(address(this).balance);
    }

    function changeOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }
    // 修饰符也可以接受输入--你只需要将输入的数据类型和名称传递给修饰符。

    modifier validAddress(address _addr){
        // 地址不为空
        require(_addr != address(0), "Not valid address");
        // 继续执行剩下的逻辑
        _;
    }

    function transferTokenTo(address someAddress) public validAddress(someAddress){
        // do something
    }
}