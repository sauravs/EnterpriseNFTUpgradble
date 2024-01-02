// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;



import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";


contract Pizza is Initializable, UUPSUpgradeable, OwnableUpgradeable {
   uint256 public slices;

    ///@dev no constructor in upgradable contracts. Instead we have initializers
    ///@param _sliceCount initial number of slices for the pizza

   function initialize(uint256 _sliceCount , address initialOwner) public initializer {
       slices = _sliceCount;

      ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
    __Ownable_init(initialOwner);
   }

   ///@dev required by the OZ UUPS module
   function _authorizeUpgrade(address) internal override onlyOwner {}

   //add upgradeTo function 
    function upgradeTo(address newImplementation) external {
    
    }

   ///@dev decrements the slices when called
   function eatSlice() public {
       require(slices > 1, "no slices left");
       slices -= 1;
   }
}