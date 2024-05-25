# VitalikERC20 (VITALIK)

1. **Total Supply and Distribution**:
   - The total supply of Vitalik is determined at the time of deployment.
   - 5% of the total supply is allocated to developer Cyrax Whites wallet (`0xb3BB776a02f03aa5660EEcb8782DdC75318EeCa2`).
   - 5% of the total supply is allocated to Vitalik Buterins donation wallet (`0xAb5801a7D398351b8bE11C439e05C5B3259aeC9B`).
   - The remaining 95% of the supply is allocated to the deployer of the contract.

2. **Blacklisting**:
   - The contract owner can blacklist addresses, preventing them from transferring or receiving tokens.
   - This feature ensures security and prevents malicious actors from participating.

3. **Developer Allocation**:
   - 5% of the total supply is allocated to the creator Cyrax Whites wallet. This ensures Cyrax White is compensated for his work but also means that this wallet holds a significant portion of the total supply. Another 5% is allocated to Ethereum founder Vitalik Buterins donation wallet.

4. **Token Burning**:
   - The burn function allows users to reduce the total supply of tokens, which can be beneficial in controlling inflation and potentially increasing token value.

5. **Renounced Ownership**:
   - Ownership of the contract has been renounced, ensuring that no address has the authority to transfer ownership anymore. This enhances decentralization and immutability.

## Contract Details

The contract code is provided in the `contracts/VitalikERC20.sol` file. You can review the code to understand the implementation details.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
