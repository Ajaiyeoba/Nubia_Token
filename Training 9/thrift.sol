// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ThriftContract {
    address public immutable owner;
    mapping(address => uint256) public deposits;

    event Deposit(address indexed contributor, uint256 amount);
    event Withdrawal(address indexed owner, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        deposit();
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount should be greater than 0");

        // Record the deposit
        deposits[msg.sender] += msg.value;

        // Emit an event
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyOwner {
        require(amount > 0, "Withdrawal amount should be greater than 0");
        require(amount <= address(this).balance, "Not enough funds in the contract");

        // Transfer the funds to the owner
        payable(owner).transfer(amount);

        // Emit an event
        emit Withdrawal(owner, amount);
    }

    // View function to get the balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

