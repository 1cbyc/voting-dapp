// pragma solidity ^0.8.0;
pragma solidity ^0.8.20;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    address public owner;
    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;

    constructor(string[] memory _candidateNames) {
        owner = msg.sender;
        for (uint i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({ name: _candidateNames[i], voteCount: 0 }));
        }
    }

    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateIndex < candidates.length, "Invalid candidate.");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    function getCanddidateCount() public view returns (uint) {
        return candidates.length;
    }
}

// contract Voting {
//     struct Proposal {
//         string name;
//         uint voteCount;
//     }

    // address public admin;
    // mapping(address => bool) public hasVoted;
    // Proposal[] public proposals;

    // constructor(string[] memory proposalNames) {
    //     admin = msg.sender;
    //     for (uint i = 0; i < proposalNames.length; i++) {
    //         proposals.push(Proposal({
    //             name: proposalNames[i],
    //             voteCount: 0
    //         }));
    //     }
    // }

//     function vote(uint proposalIndex) public {
//         require(!hasVoted[msg.sender], "Already voted.");
//         require(proposalIndex < proposals.length, "Invalid proposal.");

//         hasVoted[msg.sender] = true;
//         proposals[proposalIndex].voteCount += 1;
//     }

//     function getProposals() public view returns (Proposal[] memory) {
//         return proposals;
//     }
// }
