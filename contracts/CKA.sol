// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @notice Reference ERC-20 representation for ecosystem contracts.
/// @dev CKA itself is the native gas coin of CKCchain; this contract is NOT the native coin.
contract CKA {
    string public constant name = "CKCchain";
    string public constant symbol = "CKA";
    uint8 public constant decimals = 18;
    uint256 public constant MAX_SUPPLY = 500_000_000 ether;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    uint256 public totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(address genesisRecipient) {
        require(genesisRecipient != address(0), "zero recipient");
        totalSupply = MAX_SUPPLY;
        balanceOf[genesisRecipient] = MAX_SUPPLY;
        emit Transfer(address(0), genesisRecipient, MAX_SUPPLY);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        require(allowed >= value, "allowance");
        if (allowed != type(uint256).max) allowance[from][msg.sender] = allowed - value;
        _transfer(from, to, value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "zero recipient");
        require(balanceOf[from] >= value, "balance");
        unchecked {
            balanceOf[from] -= value;
            balanceOf[to] += value;
        }
        emit Transfer(from, to, value);
    }
}
