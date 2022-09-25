// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

enum Collection {
    OXYGEN,
    RARE_WOLFS,
    EPIC_WOLFS,
    LEGENDARY_WOLFS,
    PLANET_EARTH,
    PLANET_TIER1,
    PLANET_TIER2,
    PLANET_TIER3,
    WOOD,
    ROCK,
    IRON,
    GOLD,
    TICKET,
    OTHER
}

struct TokenProperies {
    uint256 Start;
    uint256 Current;
    uint256 End;
    uint256 Price;
    IERC20 PayableToken;
    bool Status;
    string  BaseURI;
    uint256 TotalSupply;
}

struct Planet {
    uint256 ID;
    bool Active;
    uint256 StakeNFT;
}