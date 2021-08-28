// Your contract is supposed to contain a very CRUCIAL function . 
// Your first function accepts 3 different addresses and performs the keccak256 hash of the first 2....
// it then hashes the result with the third address and returns the final hash...
// The second CRUCIAL function gets the final hash from the first function above and accepts two arguments(a number and a bytes32 value)...
// it hashes the number separately, performs a typecasting(on the bytes32[second argument]) so as to convert it to a number, hashes the number too, 
// then hashes both of the resulting hashes with the hash gotten from the previous function and finally returns the final hash
// Use the correct function visibility specifiers

contract Crucial {
    
    function crucialOne(address walletOne, address walletTwo, address walletThree) internal view returns(bytes32 hashAll) {
        bytes32 hashTwoAdds = keccak256(abi.encodePacked(walletOne, walletTwo));
        hashAll = keccak256(abi.encodePacked(hashTwoAdds, walletThree));
    }
    
    function crucialTwo(uint num, bytes32 value) public view returns(bytes32 finalHash) {
        bytes32 hashNum = keccak256(abi.encodePacked(num));
        // typecasting
        uint hashNum2 = uint(keccak256(abi.encodePacked(value)));
        bytes32 firstFunction = crucialOne(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c, 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        finalHash = keccak256(abi.encodePacked(hashNum, hashNum2, firstFunction));
    }
    
}