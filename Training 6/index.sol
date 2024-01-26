// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
 
 
 contract globalVariable {
   
    uint256 count = 10;

    function getCount() public  view returns(uint256) {
        return  count;
    }
    function incrrement() public {
         count = 100;
    }
    function decrement() public {
        count -= 1;
    }
 }