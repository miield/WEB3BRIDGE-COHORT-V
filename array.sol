pragma solidity ^0.8.0;

contract Arrays {

    // uint[][5][3][4] public street;

    uint[4] public houses;
    uint[3] public flats;
    uint[5] public rooms;
    uint[] public people = [1,2,3,4,5,6];
    
    uint public noOfFlats = houses.length * flats.length;
    uint public noOfRooms = flats.length * rooms.length;
    uint public noOfOccupants = people.length * noOfRooms;

}