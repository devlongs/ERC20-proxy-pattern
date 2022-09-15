// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

import "./Proxiable.sol";

contract MyTokenA is ERC20("Longs Token", "LNS"), Proxiable {
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner is allowed to perform this action!!");
        _;
    }

    function initialize() public {
        require(owner == address(0), "Already initalized");
        owner = msg.sender;
        _mint(_msgSender(), 10000e18);
    }

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }
}