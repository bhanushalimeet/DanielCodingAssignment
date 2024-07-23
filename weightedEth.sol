// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WeightedIndex is ERC20 {
    // Token addresses and weights
    address public token1;
    address public token2;
    uint256 public weight1;
    uint256 public weight2;

    // Mock price 
    uint256 public priceToken1;
    uint256 public priceToken2;

    // Events
    event Rebalanced(uint256 newWeight1, uint256 newWeight2);
    event PriceUpdated(uint256 newPriceToken1, uint256 newPriceToken2);
    
    constructor(
        address _token1, 
        address _token2, 
        uint256 _weight1, 
        uint256 _weight2,
        uint256 _initialPriceToken1,
        uint256 _initialPriceToken2
    ) ERC20("Weighted Index Token", "WIT") {
        require(_weight1 + _weight2 == 100, "Weights must sum to 100");
        token1 = _token1;
        token2 = _token2;
        weight1 = _weight1;
        weight2 = _weight2;
        priceToken1 = _initialPriceToken1;
        priceToken2 = _initialPriceToken2;
    }

    // update token prices
    function updatePrices(uint256 _priceToken1, uint256 _priceToken2) external {
        priceToken1 = _priceToken1;
        priceToken2 = _priceToken2;
        emit PriceUpdated(_priceToken1, _priceToken2);
    }

    // calculate the current index value
    function calculateIndexValue() public view returns (uint256) {
        uint256 valueToken1 = (priceToken1 * weight1) / 100;
        uint256 valueToken2 = (priceToken2 * weight2) / 100;
        return valueToken1 + valueToken2;
    }

    // Rebalancing function 
    function rebalance(uint256 _newWeight1, uint256 _newWeight2) external {
        require(_newWeight1 + _newWeight2 == 100, "New weights must sum to 100");
        weight1 = _newWeight1;
        weight2 = _newWeight2;
        emit Rebalanced(_newWeight1, _newWeight2);
    }

    // Optional: Mint 
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    // Optional: Burn 
    function burn(address from, uint256 amount) external {
        _burn(from, amount);
    }
}
