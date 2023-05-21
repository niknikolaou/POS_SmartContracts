// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

interface ERC1155 {
    function balanceOf(address owner, uint256 id) external view returns (uint);
}

contract DiamondScores is Ownable 
{
    mapping(address => string) private addressToNicknames;
    mapping(string => address) private nicknameToAddress;
    mapping(address => string) private scores;

    address[] private usersAddress;

    address public wolf2dContractAddress;

    
    event ScoreAdded(address player, string encryptedScore, string nickname);
    event NicknameAdded(address player, string nickname);


    function addNickname(string memory _nickname) public 
    {
        require(bytes(_nickname).length > 0,"Nickname is empty!");
        require(nicknameToAddress[_nickname] == address(0),"Nickname Already Exists!");
        require(bytes(_nickname).length >= 3 && bytes(_nickname).length <= 25,"Nickname is between 3-25 characters");
        require(bytes(addressToNicknames[msg.sender]).length <= 0,"You aready have a Nickname!");
        addressToNicknames[msg.sender] = _nickname;
        nicknameToAddress[_nickname] = msg.sender;
        emit NicknameAdded(msg.sender, _nickname);
    }

     function addScore(string memory _encryptedScore) public
    {
        if(bytes(scores[msg.sender]).length <= 0){
            usersAddress.push(msg.sender);
        }
        scores[msg.sender] = _encryptedScore;
        emit ScoreAdded(msg.sender, _encryptedScore, addressToNicknames[msg.sender]);
    }

     function getAllScores() public view returns (string[] memory) {
        string[] memory allScores = new string[](usersAddress.length);
        for (uint i = 0; i < usersAddress.length; i++) {
            allScores[i] = scores[usersAddress[i]];
        }
        return allScores;
    }

         function getAllUsernames() public view returns (string[] memory) {
        string[] memory allusernames = new string[](usersAddress.length);
        for (uint i = 0; i < usersAddress.length; i++) {
            allusernames[i] = addressToNicknames[usersAddress[i]];
        }
        return allusernames;
    }

    function getAllUsers() public view returns (address[] memory) {
        return usersAddress;
    }

    function getNicknameByAddress(address _player) public view returns (string memory) {
        return addressToNicknames[_player];
    }

        function getAddressByNickname(string memory nickname) public view returns (address) {
    return nicknameToAddress[nickname];
    }


    function getScore(address _player) public view returns (string memory) {
        return scores[_player];
    }

    function hasNFT( uint256 _tokenId, address user) public view returns (bool) {
    // Get a reference to the NFT contract
    ERC1155 nftContract = ERC1155(wolf2dContractAddress);

    // Get the balance of the NFT for the user
    uint balance = nftContract.balanceOf(user, _tokenId);

    // Return true if the balance is greater than zero, false otherwise
    return balance > 0;
    }

    //Administrator Functions
    function setnftContractAddress(address address2dWolf) public onlyOwner {
        wolf2dContractAddress = address2dWolf;
    }
}