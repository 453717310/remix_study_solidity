// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract C {
    string public author = "Zubin";

    function getAuthor() public virtual returns (string memory) {
        return author;
    }
}



