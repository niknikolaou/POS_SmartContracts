// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "./utils/ContextMixin.sol";
import "./utils/EnumDeclaration.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

abstract contract POSFactory is  Ownable,Pausable,ContextMixin,IERC2981,ERC1155Supply,ERC1155Burnable
{
   //=======Variables============
    string public name = "Path of Salvation P2E";
    string public baseExtension = ".json";
    IERC20 payableToken;
    mapping(address => Planet) public Planets;

    //TOKENS
     mapping (Collection=> TokenProperies)  public GameCollection;

   //===============================
    // ======== Royalties =========
    address public royaltyAddress;
    uint256 public royaltyPercent;

    //=============================
    //==OWNER======================
    function pause() external onlyOwner
    {
        _pause();
    }

    function unpause() external onlyOwner
    {
        _unpause();
    }

        function setURI(Collection _collection,string memory _baseURI) external onlyOwner {
        TokenProperies storage token = GameCollection[_collection];
        token.BaseURI = _baseURI;
    }

   function SetTokenStatus(Collection _collection, bool _status) external onlyOwner
   {
     TokenProperies storage token = GameCollection[_collection];
     token.Status = _status;
   }

   function SetTokenPrice(Collection _collection, uint256  _price) external onlyOwner
   {
     TokenProperies storage token = GameCollection[_collection];
     token.Price = _price;
   }

      function SetTokensInCirculation(Collection _collection, uint256  _totalSupply) external onlyOwner
   {
     TokenProperies storage token = GameCollection[_collection];
     token.TotalSupply = _totalSupply;
   }

   function AddPlanet(address planet, bool active) public {

            Planets[planet].Active = active;
      }

   function setPaymentToken(address token) public onlyOwner {
        payableToken = IERC20(token);
    }

    function withdraw() public payable onlyOwner {
        (bool os, ) = payable(owner()).call{value: address(this).balance}("");
        require(os);
    }

    function GetpayableTokenBalance() public onlyOwner view returns(uint256){
       return payableToken.balanceOf(address(this));
   }

    //============ERC1155===========================
    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply) whenNotPaused {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }

  
    //==============================================
    //===========Payable Functions==========================
    
    function AcceptPayment(uint256 _tokenamount) public returns(bool) 
    { 
       payableToken.transfer(address(this), _tokenamount);
       return true;
   }

   function GetAllowance() public view returns(uint256){
       return payableToken.allowance(msg.sender, address(this));
   }

    //==============Royalities Functions===============

    function setRoyaltyReceiver(address royaltyReceiver) public onlyOwner {
        royaltyAddress = royaltyReceiver;
    }

    function setRoyaltyPercentage(uint256 royaltyPercentage) public onlyOwner {
        royaltyPercent = royaltyPercentage;
    }

    function royaltyInfo(uint256 tokenId, uint256 salePrice)
        external
        view
        override
        returns (address receiver, uint256 royaltyAmount)
    {
        require(exists(tokenId), "Non-existent token");
        return (royaltyAddress, (salePrice * royaltyPercent) / 100);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155, IERC165)
        returns (bool)
    {
        return
            interfaceId == type(IERC2981).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /** @dev Meta-transactions override for OpenSea. */

    function _msgSender() internal view override returns (address) {
        return ContextMixin.msgSender();
    }
}
