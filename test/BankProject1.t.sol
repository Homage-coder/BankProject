// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/BankProject1.sol";

contract BankProject1Test is Test {
    BankProject1 bank;

    function setUp() public {
        bank = new BankProject1();
    }

    function testCreateAccount() public {
        bank.createAccount("Daniel");
        (address accountHolder, string memory name, uint256 balance, bool exists) =
            bank.accounts(address(this));

        assertEq(accountHolder, address(this));
        assertEq(name, "Daniel");
        assertEq(balance, 0);
        assertTrue(exists);
    }

    function testDeposit() public {
        bank.createAccount("Daniel");
        bank.deposit{value: 1 ether}();

        assertEq(bank.getBalance(address(this)), 1 ether);
    }

    function testWithdraw() public {
        bank.createAccount("Daniel");
        bank.deposit{value: 2 ether}();
        bank.withdraw(1 ether);

        assertEq(bank.getBalance(address(this)), 1 ether);
    }
}
