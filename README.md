


TESTING ON REMIX IDE

### Step 1: Compile the Smart Contract

1. Click on the "Solidity Compiler" icon on the left.
2. Make sure the `WeightedIndex.sol` file is selected.
3. Select Solidity version `0.8.0` or higher.
4. Click on the "Compile WeightedIndex.sol" button.

### Step 2: Deploy the Smart Contract

1. Click on the "Deploy & Run Transactions" icon on the left.
2. Select `Injected Web3` as the environment if you want to use MetaMask. Otherwise, you can use the `JavaScript VM` for a local blockchain.
3. Make sure you have selected the correct account in MetaMask.
4. Fill in the constructor parameters:
   - `_token1`: Enter a dummy Ethereum address (e.g., `0x0000000000000000000000000000000000000001`).
   - `_token2`: Enter another dummy Ethereum address (e.g., `0x0000000000000000000000000000000000000002`).
   - `_weight1`: Enter the weight for token 1 (e.g., `50`).
   - `_weight2`: Enter the weight for token 2 (e.g., `50`).
   - `_initialPriceToken1`: Enter the initial price for token 1 (e.g., `100`).
   - `_initialPriceToken2`: Enter the initial price for token 2 (e.g., `200`).

5. Click on the "Deploy" button.

### Step 3: Interact with the Smart Contract

1. After deployment, the deployed contract instance will appear at the bottom of the "Deploy & Run Transactions" panel.
2. You can interact with the smart contract functions from this interface:

   - **updatePrices**: Enter new prices for the tokens and click "transact".
   - **calculateIndexValue**: Click on the "calculateIndexValue" button to view the current index value.
   - **rebalance**: Enter new weights for the tokens and click "transact".
   - **mint**: Enter an address and amount to mint new index tokens.
   - **burn**: Enter an address and amount to burn index tokens.

### Testing Example

1. **Update Prices**:
   - Enter new prices for `priceToken1` and `priceToken2` (e.g., `150` and `250`).
   - Click the `transact` button next to `updatePrices`.

2. **Calculate Index Value**:
   - Click the `calculateIndexValue` button to see the updated index value.

3. **Rebalance Weights**:
   - Enter new weights (e.g., `40` for `_newWeight1` and `60` for `_newWeight2`).
   - Click the `transact` button next to `rebalance`.

4. **Mint Tokens**:
   - Enter an address and amount (e.g., your MetaMask account address and `100`).
   - Click the `transact` button next to `mint`.

5. **Burn Tokens**:
   - Enter an address and amount (e.g., your MetaMask account address and `50`).
   - Click the `transact` button next to `burn`.
