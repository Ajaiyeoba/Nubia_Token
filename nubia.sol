// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/ERC20.sol";

contract NubiaToken is ERC20 {
    constructor()
        ERC20("Nubia Token", "NUB")
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}