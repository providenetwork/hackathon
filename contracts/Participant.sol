pragma solidity ^0.4.23;

contract Participant {

    enum Role {
        Designer,
        Developer,
        SolidityDeveloper
    }

    address public identity;
    Role public role;

    constructor(address _identity, Role _role) public {
        identity = _identity;
        role = _role;
    }
}
