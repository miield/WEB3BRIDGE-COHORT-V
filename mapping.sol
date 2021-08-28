contract Mappyns {
    
    // A contract contains two very important mappings which are used to track some very *private* info...
    // The first mapping allows you to know how many times an address has called a function, 
    // the second one allows you to know the function hash that the address called last...
    // Write three different functions that don't *really do anything but returns a bool value* 
    // and update the mappings accordingly

    mapping(address => uint) noOfTimes;
    mapping(address => bytes32) lastFunctionCalled;
    
    function updateCall() public returns(bool) {
        noOfTimes[msg.sender]++;
        lastFunctionCalled[msg.sender] = keccak256(abi.encodePacked('updateCall()'));
        return true;
    }
    
    function updateCall2() public returns(bool) {
        noOfTimes[msg.sender]++;
        lastFunctionCalled[msg.sender] = keccak256(abi.encodePacked('updateCall2()'));
        return false;
    }
    
    function updateCall3() public returns(bool) {
        noOfTimes[msg.sender]++;
        lastFunctionCalled[msg.sender] = keccak256(abi.encodePacked('updateCall3()'));
        return true;
    }
    
}