// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DonationContract {
    address public owner;
    mapping(address => uint256) public donations;
    uint256 public totalDonations;

    event DonationReceived(address indexed donor, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
    

    constructor() {
        owner = msg.sender;
    }

    function donate() external payable {
        require(msg.value > 0, "Donation amount should be greater than 0");

        // Record the donation
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;

        // Emit an event
        emit DonationReceived(msg.sender, msg.value);
    }

    function withdraw() external onlyOwner {
        require(address(this).balance > 0, "No funds to withdraw");

        // Transfer the funds to the owner
        payable(owner).transfer(address(this).balance);
    }

    // View function to get the balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
