```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BankProject1 {
    struct Account {
        address accountHolder;
        string name;
        uint256 balance;
        bool exists;
    }

    mapping(address => Account) public accounts;
    uint256 public totalBankBalance;

    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    function createAccount(string memory _name) external {
        require(!accounts[msg.sender].exists, "Account already exists");

        accounts[msg.sender] = Account({
            accountHolder: msg.sender,
            name: _name,
            balance: 0,
            exists: true
        });
    }

    function deposit() external payable {
        require(accounts[msg.sender].exists, "Create an account first");
        require(msg.value > 0, "Amount must be greater than zero");

        accounts[msg.sender].balance += msg.value;
        totalBankBalance += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(accounts[msg.sender].exists, "Account does not exist");
        require(_amount > 0, "Amount must be greater than zero");
        require(accounts[msg.sender].balance >= _amount, "Insufficient balance");

        accounts[msg.sender].balance -= _amount;
        totalBankBalance -= _amount;

        payable(msg.sender).transfer(_amount);

        emit Withdrawal(msg.sender, _amount);
    }

    function getBalance(address _user) external view returns (uint256) {
        return accounts[_user].balance;
    }
}
```

---
