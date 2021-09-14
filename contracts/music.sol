// SPDX-License-Identifier: MIT

// Write a contract that does some very important work. It
// should contain some very important data structures like Structs,mappings,public 
// and private variables,arrays etc[remember to be flexible s pick your choice]...
// Write a script using hardhat-ethersjs to deploy the contract and call the functions 
// while logging the output to the console....Write a test in js to test some of its functionalities *

pragma solidity ^0.8.0;

contract Music {
    
    address internal admin;
    
    constructor() {
        admin = msg.sender;
    } 
    
    struct User {
        address ownerAddress;
        string username;
        bool isExist;
    }
    
    struct Playlist {
        string name;
        string genre;
        uint noOfSongs;
        // bool isPlaylist;
        bytes32[] songMetasss; 
    }
    
    struct Song {
        address songUploader;
        uint time;
        bytes32 songMeta;
    }
    
    // Playlist newPlaylist;
    // User newUser; 
    
    mapping(address => User) public addToUser;
    mapping(address => Playlist) public userToPlaylist;
    mapping(address => Song) public userToSong;
    mapping(bytes32 => Song) public metaToSong;
    
    function signUp(string memory _username) public returns(string memory) {
        require(addToUser[msg.sender].isExist == false, "Address already exist");
        require(msg.sender != address(0), "Invalid Address");
        User storage newUser = addToUser[msg.sender];
        newUser.ownerAddress = msg.sender;
        newUser.username = _username;
        newUser.isExist = true;
        return ("success");
    }
    
    function viewProfile() public view returns(User memory) {
        return addToUser[msg.sender];
    }
    
    function createPlaylist(string memory name_, string memory genre_) public returns(Playlist memory) {
        require(addToUser[msg.sender].isExist == true, "Sign up first");
        Playlist storage newPlaylist = userToPlaylist[msg.sender];
        newPlaylist.name = name_;
        newPlaylist.genre = genre_;
        newPlaylist.noOfSongs;
        newPlaylist.songMetasss;
        // newPlaylist.isPlaylist = true;
        return newPlaylist;
    }

    function viewPlaylist() public view returns(Playlist memory) {
        return userToPlaylist[msg.sender];
    }
    
    function addSongs() public returns(bytes32 meta) {
        require(addToUser[msg.sender].isExist == true, "Sign up first");
        // require(userToPlaylist[msg.sender].isPlaylist == true, "First create a playlist");
        meta = keccak256(abi.encodePacked(block.timestamp, msg.sender)); // create the meta for each song
        userToSong[msg.sender].songUploader = msg.sender;
        metaToSong[meta].songMeta = meta;
        userToPlaylist[msg.sender].songMetasss.push(meta);
        userToPlaylist[msg.sender].noOfSongs++;
        return meta;
    }
    
    // to be continued...

}