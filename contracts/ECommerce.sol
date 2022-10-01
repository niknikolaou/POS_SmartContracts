// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ECommerce is Ownable {
     IERC20 public token;

       
    function SetToken(address _token) public onlyOwner{
        token = IERC20(_token);
    }
    
     
   function GetUserTokenBalance() public view returns(uint256){ 
       return token.balanceOf(msg.sender);// balancdOf function is already declared in ERC20 token function
   }
   
   
   function Approvetokens(uint256 _tokenamount) public returns(bool){
       token.approve(address(this), _tokenamount);
       return true;
   }
   
   
   function GetAllowance() public view returns(uint256){
       return token.allowance(msg.sender, address(this));
   }
   
   function AcceptPayment(uint256 _tokenamount) public returns(bool) {
       require(_tokenamount > GetAllowance(), "Please approve tokens before transferring");
       token.transfer(address(this), _tokenamount);
       return true;
   }
   
   
   function GetContractTokenBalance() public onlyOwner view returns(uint256){
       return token.balanceOf(address(this));
   }
   
}