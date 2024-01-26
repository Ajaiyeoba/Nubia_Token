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


// https://sepolia.arbiscan.io/tx/0x9f6602b859b59effdf651696a3b57a71cc912a3e6e4d49e1f4ab2301210c109b