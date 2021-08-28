// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Week6 {
    
    bytes32 PackOne;
    bytes32 PackTwo;

    function packedOne(string memory name, uint password) public {
        PackOne = keccak256(abi.encodePacked(name, password));
    }

    function packedTwo(address wallet, uint amount) public {
        PackTwo = keccak256(abi.encodePacked(wallet, amount));
    }

    function viewHash()public view returns(bytes32, bytes32) {
        return(PackOne, PackTwo);
    }
    
}