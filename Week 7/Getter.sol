// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "./Setter.sol";

abstract contract Context {
    
    
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
    
}


contract Getter is Context {
    
   Setter getter;
   
    constructor(address deployer_) {
        getter = Setter(deployer_);
    }
    
    modifier checkApproval(bytes4 id_) { 
        require(getter.admin() == _msgSender(), "You're not admin");
        require(getter.checkAllowance(id_, _msgSender()) == true, "You're not allowed");
        _;
    }
    
    function getUser(bytes4 id) public view checkApproval(id) returns(address, string memory, bytes4) {
        return getter.UserId(id);
    }
    
}

interface IGetter {
    function getUser(bytes4 id) external;
}
