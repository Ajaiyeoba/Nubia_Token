// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DonationContract {
    address public immutable owner;
    mapping(address => uint256) public donations;
    uint256 public totalDonations;
    uint256 public immutable withdrawalDelay = 30 days;
    uint256 public immutable withdrawalStartTime;

    event DonationReceived(address indexed donor, uint256 amount);
    event Withdrawal(address indexed owner, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier canWithdraw() {
        require(
            msg.sender == owner && block.timestamp >= withdrawalStartTime,
            "Cannot withdraw yet"
        );
        _;
    }

    constructor() {
        owner = msg.sender;
        withdrawalStartTime = block.timestamp + withdrawalDelay;
    }

    receive() external payable {
        donate();
    }

    function donate() public payable {
        require(msg.value > 0, "Donation amount should be greater than 0");

        // Record the donation
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;

        // Emit an event
        emit DonationReceived(msg.sender, msg.value);
    }

    function withdraw() external onlyOwner canWithdraw {
        require(address(this).balance > 0, "No funds to withdraw");

        // Transfer the funds to the owner
        uint256 amountToWithdraw = address(this).balance;
        payable(owner).transfer(amountToWithdraw);

        // Emit an event
        emit Withdrawal(owner, amountToWithdraw);
    }

    // View function to get the balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
