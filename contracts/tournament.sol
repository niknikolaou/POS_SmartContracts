// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

interface DiamondHands {
    function getNicknameByAddress(address _player) external view returns (string memory);
}

interface ERC1155 {
    function balanceOf(address owner, uint256 id) external view returns (uint);
}

contract Tournament  is Ownable {

    uint256 public activeTournament;
    address public diamondHands;
    address public wolf2dContractAddress;


    struct TournamentDetails
    {   string name;   
        uint256 startDate;
        uint256 endDate;
        bool nftpass;
        uint256 tokenId;
        address[] usersAddress;
        mapping(address => string) scores;
    }

    // Mapping to store the tournaments
    mapping (uint256 => TournamentDetails) public tournaments;

    event TournamentCreated(uint256 tournamentId, uint256 startDate, uint256 endDate, bool nftpass, uint256 _tokenId);


    function isActive() public view returns (bool) 
    {
        // Get the tournament details for the given ID
        TournamentDetails storage tournament = tournaments[activeTournament];

        // Check if the current time is between the start and end dates
        uint256 currentTime = block.timestamp;
        return tournament.startDate <= currentTime && currentTime <= tournament.endDate;
    }

        function NeedNft() public view returns (bool) 
    {
        return tournaments[activeTournament].nftpass;
    }

        function TokenID() public view returns (uint256) 
    {
        return tournaments[activeTournament].tokenId;
    }

     function TimeNow() public view returns (uint256) 
    {   
        return block.timestamp;
    }


    function addScoreT(string memory _encryptedScore) public {
        require(isActive(),"Out of Time");
         TournamentDetails storage tournament = tournaments[activeTournament];
         if (tournaments[activeTournament].nftpass)
            require(hasNFT(msg.sender),"Need NFT PASS");
        if(bytes(tournament.scores[msg.sender]).length <= 0){
            tournament.usersAddress.push(msg.sender);
        }
        tournament.scores[msg.sender] = _encryptedScore;
    }

    function getAllScores() public view returns (string[] memory)
    {
        TournamentDetails storage tournament = tournaments[activeTournament];
        
        string[] memory allScores = new string[](tournament.usersAddress.length);
        for (uint i = 0; i < tournament.usersAddress.length; i++) {
            allScores[i] = tournament.scores[tournament.usersAddress[i]];
        }
        return allScores;
    }

    function getAllUsers() public view returns (address[] memory) {
        TournamentDetails storage tournament = tournaments[activeTournament];
        return tournament.usersAddress;
    }

    function getAllUsernames() public view returns (string[] memory) {
         TournamentDetails storage tournament = tournaments[activeTournament];
        string[] memory allusernames = new string[](tournament.usersAddress.length);
        for (uint i = 0; i < tournament.usersAddress.length; i++) {
            allusernames[i] = DiamondHands(diamondHands).getNicknameByAddress(tournament.usersAddress[i]);
        }
        return allusernames;
    }

    function getScore(address _player) public view returns (string memory) {
        TournamentDetails storage tournament = tournaments[activeTournament];
        return tournament.scores[_player];
    }


     function getTournamentName() public view returns (string memory){
        TournamentDetails storage tournament = tournaments[activeTournament];
        return tournament.name;
    }

      function getTournamentStartDate() public view returns (uint256){
        TournamentDetails storage tournament = tournaments[activeTournament];
        return tournament.startDate;
    }

          function getTournamentEndDate() public view returns (uint256){
        TournamentDetails storage tournament = tournaments[activeTournament];
        return tournament.endDate;
    }

    function getRemainingTime() public view returns (uint256) {
        TournamentDetails storage tournament = tournaments[activeTournament];
        uint256 remainingTime = 0;
        if (block.timestamp < tournament.endDate)
        {
         remainingTime = tournament.endDate - block.timestamp;
        }
        return remainingTime;
    }

  function hasNFT( address user) public view returns (bool) {
    // Get a reference to the NFT contract
    ERC1155 nftContract = ERC1155(wolf2dContractAddress);

    // Get the balance of the NFT for the user
    uint balance = nftContract.balanceOf(user, tournaments[activeTournament].tokenId);

    // Return true if the balance is greater than zero, false otherwise
    return balance > 0;
    }


    // Administrator

    function createTournament(string memory _name,uint256 _startDate, uint256 _endDate, bool _nftpass, uint256 _tokenId) public onlyOwner
    {
        // Generate a unique ID for the tournament
        uint256 tournamentId = uint256(keccak256(abi.encodePacked(_startDate)));
        activeTournament = tournamentId;
        // Update the tournament details in the mapping
        tournaments[tournamentId].name = _name;
        tournaments[tournamentId].startDate = _startDate;
        tournaments[tournamentId].endDate = _endDate;
        tournaments[tournamentId].nftpass = _nftpass;
        tournaments[tournamentId].tokenId = _tokenId;

        // Emit the event to notify the tournament creation
        emit TournamentCreated(tournamentId, _startDate, _endDate,  _nftpass,_tokenId);

    }


    function setDiamondHandsContract(address _diamondHands) public onlyOwner 
    {
        diamondHands = _diamondHands;
    }

    function setnftContractAddress(address address2dWolf) public onlyOwner {
        wolf2dContractAddress = address2dWolf;
    }
    
}