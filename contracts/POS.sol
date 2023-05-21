// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./POSFactory.sol";
contract POS is POSFactory {

    constructor( ) ERC1155("")  {
        royaltyAddress = msg.sender;
        royaltyPercent = 10;
        
        GameCollection[Collection.OXYGEN]= TokenProperies(0,0,0,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",100000000000000);
        GameCollection[Collection.RARE_WOLFS]= TokenProperies(1,1,6000,1 ether,first_token,false,"ipfs://bafybeib3mjyhwssyusp5vsl7tiqho3co74zmf3ymafl7suw2gw52fcyawe/",1);
        GameCollection[Collection.EPIC_WOLFS]= TokenProperies(6001,6001,9000,1 ether,first_token,false,"ipfs://bafybeib3mjyhwssyusp5vsl7tiqho3co74zmf3ymafl7suw2gw52fcyawe/",1);
        GameCollection[Collection.LEGENDARY_WOLFS]= TokenProperies(9001,9001,10000,1 ether,first_token,false,"ipfs://bafybeib3mjyhwssyusp5vsl7tiqho3co74zmf3ymafl7suw2gw52fcyawe/",1);
        GameCollection[Collection.PLANET_EARTH]= TokenProperies(10001,10001,10001,1 ether,first_token,false,"",1);
        GameCollection[Collection.PLANET_TIER1]= TokenProperies(10002,10002,10032,1 ether,first_token,false,"",1);
        GameCollection[Collection.PLANET_TIER2]= TokenProperies(10033,10033,10047,1 ether,first_token,false,"",1);
        GameCollection[Collection.PLANET_TIER3]= TokenProperies(10048,10048,10052,1 ether,first_token,false,"",1);
        GameCollection[Collection.WOOD]= TokenProperies(10053,10053,10053,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",1000*1000*1000);
        GameCollection[Collection.ROCK]= TokenProperies(10054,10054,10054,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",1000*1000*1000);
        GameCollection[Collection.IRON]= TokenProperies(10055,10055,10055,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",1000*1000*1000);
        GameCollection[Collection.GOLD]= TokenProperies(10056,10056,10056,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",1000*1000*1000);
        GameCollection[Collection.TICKET]= TokenProperies(10057,10057,10057,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",1000*1000*1000);
        GameCollection[Collection.OTHER]= TokenProperies(10058,10058,10058,1 ether,first_token,false,"ipfs://bafybeihwk7lhvilqho3ymhv4wb3ejmiitliqdwycu4g4e2rq6gtqonfzn4/",1000*1000*1000);
    }
          function mint(Collection _collection) public {
            TokenProperies storage token = GameCollection[_collection];
            require(token.Status == true,"token is not enable");
            require(token.Current <= token.End, "All tokens are minted");
           // require(msg.sender == tx.origin, "Smart contracts cant Mint");
           require(token.Price <= GetAllowance(token.PayableToken), "Please approve tokens before transferring");
           if(GetPayment(_collection)){
             _mint(msg.sender, token.Current, token.TotalSupply, "");
        unchecked {
            token.Current++;
                }}
               
    }

        function GetTicket(address wolf) public{
        require(Planets[msg.sender].Active == true);
            _mint(wolf, 12, 1, "");
        }

    function uri(uint256 _id) public view override returns (string memory) {
            require(exists(_id), "URI: nonexistent token");
            TokenProperies memory token = GameCollection[Collection.OTHER];
            if(_id>=1&&_id<=10000)
            token = GameCollection[Collection.RARE_WOLFS];
            if(_id>=10001&&_id<=10052)
            token = GameCollection[Collection.PLANET_EARTH];
           return bytes(token.BaseURI).length > 0 ? string(abi.encodePacked(token.BaseURI,Strings.toString(_id), baseExtension)) : "";
    }

}