// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Main contract for VitalikCoin
contract VitalikCoin is Ownable, ERC20 {
    address public uniswapV2Pair; // Address for Uniswap trading pair
    address public devWallet = 0x1234567890abcdef1234567890abcdef12345678; // Developer's wallet address

    // Map to keep track of blacklisted addresses
    mapping(address => bool) public blacklists;

    // Events to log important actions
    event Blacklisted(address indexed account, bool isBlacklisted);
    event TokensBurned(address indexed account, uint256 amount);

    /**
     * Constructor to create the token and allocate the initial supply
     * @param _totalSupply Total number of tokens to be created
     */
    constructor(uint256 _totalSupply) ERC20("Vitalik", "VITALIK") {
        // Calculate the number of tokens for the developer (5%)
        uint256 devWalletAmount = (_totalSupply * 5) / 100;
        
        // Allocate tokens to the developer's wallet
        _mint(devWallet, devWalletAmount);

        // Allocate the remaining tokens to the deployer
        _mint(msg.sender, _totalSupply - devWalletAmount);
    }

    /**
     * Function to add or remove addresses from the blacklist
     * @param _address Address to be blacklisted or removed from blacklist
     * @param _isBlacklisting True to blacklist, false to remove from blacklist
     */
    function blacklist(address _address, bool _isBlacklisting) external onlyOwner {
        blacklists[_address] = _isBlacklisting;
        emit Blacklisted(_address, _isBlacklisting);
    }

    /**
     * Internal function that runs before any transfer of tokens
     * This function ensures compliance with set rules and prevents blacklisted addresses from transferring tokens.
     * @param from Address sending the tokens
     * @param to Address receiving the tokens
     * @param amount Number of tokens being transferred
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) override internal virtual {
        // Prevent transfers if either sender or receiver is blacklisted
        require(!blacklists[to] && !blacklists[from], "Blacklisted");

        // If Uniswap trading hasn't started, only the owner can transfer tokens
        if (uniswapV2Pair == address(0)) {
            require(from == owner() || to == owner(), "Trading is not started");
            return;
        }
    }

    /**
     * Function to burn tokens, reducing the total supply
     * This can be used to decrease the number of tokens in circulation, potentially increasing the value of remaining tokens.
     * @param value Number of tokens to burn
     */
    function burn(uint256 value) external {
        _burn(msg.sender, value);
        emit TokensBurned(msg.sender, value);
    }
}
