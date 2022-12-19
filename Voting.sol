// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Voting{
    mapping(address=>bool) isParticipant;
    mapping(address=>bool) isVoter;
    mapping(address=>uint) public votes;

    struct Participants{
        string name;
        address id;
    }

    Participants[] public participant;

    function Participate(string memory _name) public {
        require(!isParticipant[msg.sender], "Already a participant");
        participant.push(Participants(_name, msg.sender));
        isParticipant[msg.sender] = true;
    }

    function Vote(address _voteTo) public {
        require(!isVoter[msg.sender], "You've already casted your vote");
        require(isParticipant[_voteTo], "Wrong casting");
        votes[_voteTo] += 1;
        isVoter[msg.sender] = true;
    }
}
