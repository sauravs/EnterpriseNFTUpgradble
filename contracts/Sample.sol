
//add license statement

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Sample {
    uint256 public value;

    constructor(uint256 _value) {
        value = _value;
    }

    function increment() public {
        value += 1;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}

