// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();
    error PasswordStore__InvalidPassword();
    error PasswordStore__ZeroAddress();

    address private s_owner;
    bytes32 private s_passwordHash;

    event SetNewPassword(address indexed owner, bytes32 passwordHash);
    event OwnershipTransferred(address indexed oldOwner, address indexed newOwner);

    constructor() {
        s_owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != s_owner) revert PasswordStore__NotOwner();
        _;
    }

    function setPassword(string memory newPassword) external onlyOwner {
        uint256 length = bytes(newPassword).length;
        if (length < 8 || length > 64) revert PasswordStore__InvalidPassword();

        s_passwordHash = keccak256(bytes(newPassword));
        emit SetNewPassword(msg.sender, s_passwordHash);
    }

    function getPasswordHash() external view onlyOwner returns (bytes32) {
        return s_passwordHash;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        if (newOwner == address(0)) revert PasswordStore__ZeroAddress();
        emit OwnershipTransferred(s_owner, newOwner);
        s_owner = newOwner;
    }
}
