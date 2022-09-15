// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

import "./Proxiable.sol";

contract MyTokenB is ERC20("Gbotemi Token", "GBT"), Proxiable {
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner is allowed to perform this action!");
        _;
    }

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    function burnToken(uint256 _amount) external onlyOwner {
        _burn(address(0), _amount);
    }
}