// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/ForLoop.sol";

contract ForLoopTest is Test {
    ForLoop forLoop;

    function setUp() public {
        forLoop = new ForLoop();
    }

    function testAddMultipleAccounts() public {
        address[] memory addresses = new address[](2);
        string[] memory names = new string[](2);
        uint256[] memory balances = new uint256[](2);

        addresses[0] = address(0x1);
        addresses[1] = address(0x2);

        names[0] = "Alice";
        names[1] = "Bob";

        balances[0] = 100;
        balances[1] = 200;

        forLoop.addMultipleAccounts(addresses, names, balances);

        assertEq(forLoop.getAccountsCount(), 2);
    }
}
