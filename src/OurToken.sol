// SPDX-License-Identifier: GPLv3

pragma solidity ^0.8.19;

import {ERC20} from "@openzepplin/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initalSupply) ERC20("OurToken", "OTT") {
        _mint(msg.sender, initalSupply);
    }
}
