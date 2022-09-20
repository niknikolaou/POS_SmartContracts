// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.16;

interface IPOS {
    function GetTicket(address wolf) external;
}

contract PlanetEarth {
    IPOS POS;
   
    constructor(address _pos) {
        POS = IPOS(_pos);
    }

     function sendTicket() external {
        POS.GetTicket(msg.sender);
    }
}