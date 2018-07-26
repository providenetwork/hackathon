pragma solidity ^0.4.23;

contract Judge {

    enum Tier {
        One,
        Two
    }

    address public identity;
    Tier public tier;
    
    constructor(address _identity, Tier _tier) public {
        identity = _identity;
        tier = _tier;
    }
}
