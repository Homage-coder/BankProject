```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ForLoop {
    struct Account {
        address accountHolder;
        string name;
        uint256 balance;
    }

    Account[] public accounts;

    function addMultipleAccounts(
        address[] memory _addresses,
        string[] memory _names,
        uint256[] memory _balances
    ) external {
        require(
            _addresses.length == _names.length &&
            _names.length == _balances.length,
            "Input arrays must have the same length"
        );

        for (uint256 i = 0; i < _addresses.length; i++) {
            accounts.push(
                Account({
                    accountHolder: _addresses[i],
                    name: _names[i],
                    balance: _balances[i]
                })
            );
        }
    }

    function getAccountsCount() external view returns (uint256) {
        return accounts.length;
    }

    function getAccount(uint256 _index)
        external
        view
        returns (address, string memory, uint256)
    {
        Account memory account = accounts[_index];
        return (account.accountHolder, account.name, account.balance);
    }
}
```

---
