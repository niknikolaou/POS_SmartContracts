// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.16;

contract PathOfNicolas {
  mapping(address => Player) players;


  function GetUserInfo(address wallet) public view returns (Player memory){
       Player memory player = players[wallet];
       return player;
  }

  function RegisterInGame() external 
  {
     require(!players[msg.sender].register, "already register");
      Player storage player = players[msg.sender];
      player.register = true;
      for (uint i = 0; i < player.buildings.length; i++) {
            Building storage building = player.buildings[i];
            building.Currentlevel = 1;
        }
  }
  
  function UpdateBuilding(uint _id) external 
  {
     require(players[msg.sender].register, "you are not register");
      Player storage player = players[msg.sender];
      require(player.buildings[_id].Finish<block.timestamp, "Update still pending");
     player.buildings[_id].Start = block.timestamp;
     player.buildings[_id].Finish = block.timestamp+(10*player.buildings[_id].Currentlevel);
     player.buildings[_id].Pending = true;
      
  }

    function CompleteUpdateBuilding(uint _id) external 
  {
     require(players[msg.sender].register, "you are not register");

      Player storage player = players[msg.sender];
      require(player.buildings[_id].Finish>block.timestamp, "Still Updating");
       require(player.buildings[_id].Pending, "Update First");
     player.buildings[_id].Currentlevel +=1;
     player.buildings[_id].Start = 0;
     player.buildings[_id].Finish = 0;
     player.buildings[_id].Pending = false;
      
  }

   function CurrectTime() public view returns(uint)
  {
     return block.timestamp;
      
  }

  }


struct Player{
  bool register;
  Building[3] buildings;
}

struct Building{
  uint Currentlevel;
  bool Pending;
  uint Start;
  uint Finish;

}