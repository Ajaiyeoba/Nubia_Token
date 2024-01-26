// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ArithmeticContract {
    function isOdd(uint256 number) public pure returns (bool) {
        return number % 2 != 0;
    }

    function isEven(uint256 number) public pure returns (bool) {
        return number % 2 == 0;
    }

    function getMostSignificantBit(uint256 number) public pure returns (uint256) {
        require(number > 0, "Number must be greater than 0");

        // Find the position of the most significant bit
        uint256 mostSigBit = 0;
        while (number > 0) {
            number = number >> 1;
            mostSigBit++;
        }

        return mostSigBit;
    }
}
