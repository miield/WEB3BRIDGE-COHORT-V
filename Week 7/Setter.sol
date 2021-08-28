// A particular financial institution is looking to have their records stored onchain and
// looking to have an *external *identifier tied to each customers Details....the identifier
// should be the keccak256 hash of the customer's name and time of registration ,
// each customer can also approve another customer to view their details[meaning that only admins and approved
// customers have the right to view another customer's data]....For simplicity purposes, the Bank is looking to
// have a separate contract that has all setter functions and another contract that has all the
// *getter * functions(Interacting with each other of course)..Finally, they want
// an interface for all the contracts they have......USE THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS

// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

interface ISetter {
     struct Customer{
        address user;
        string name;
        bytes4 hashId;
    }
    function createCustomer(string memory name_) external;
    function accessToDetails(address newCustomer_, bytes4 id_) external;
}

contract Setter{
    // state variables
    address public admin;
    bytes4 public id;
    
    struct Users {
        address user;
        string name;
        bytes4 hashId;
    }
    
    mapping(bytes4 => Users) public UserId;
    mapping(bytes4 => mapping(address => bool)) public checkAllowance; // to check for both the address and the Id of customer if true.
    constructor(){
        admin = msg.sender; // admin is the deployer
    }
    
    // create users 
    function createCustomer(string memory name_) public {
        id = bytes4(keccak256(abi.encodePacked(name_, block.timestamp))); // identifier
        Customer storage newCustomer = UserId[id];
        newCustomer.user = msg.sender;
        newCustomer.name = name_;
        newCustomer.hashId = id;
    }
    
    // only admin and allowed customers can call this function.
    function accessToDetails(address newCustomer_, bytes4 id_) public {
        require(newCustomer_ == msg.sender, "You're not allowed ");
        require (checkAllowance[id_][newCustomer_] = true, "You're not allowed");
    }
    
}

