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