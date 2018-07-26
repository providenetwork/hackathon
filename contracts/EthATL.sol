pragma solidity ^0.4.23;

import './Judge.sol';
import './Participant.sol';
import './Project.sol';

contract EthATL {

    Judge[] public judges;
    Participant[] public participants;
    Project[] public projects;

    mapping(address => bool) organizers;

    // TODO: ERC20Token public token;

    uint public tier1TokenAllocation;
    uint public tier2TokenAllocation;

    bool public hackathonStarted;

    constructor(address[] _organizers, uint _tier1TokenAllocation, uint _tier2TokenAllocation) public {
        tier1TokenAllocation = _tier1TokenAllocation;
        tier2TokenAllocation = _tier2TokenAllocation;
        
        organizers[msg.sender] = true;

        for (uint i = 0; i < _organizers.length; i++) {
            organizers[_organizers[i]] = true;
        }
    }

    function startHackathon() public onlyOrganizer onlyBeforeHackathon {
        // TODO: evenly distribute tier 1 token allocation to tier 1 judges
        // TODO: evenly distribute tier 2 token allocation to tier 2 judges

        hackathonStarted = true;
    }

    modifier onlyOrganizer() {
        require(organizers[msg.sender]);
        _;
    }
    
    modifier onlyBeforeHackathon() {
        require(!hackathonStarted);
        _;
    }
}
