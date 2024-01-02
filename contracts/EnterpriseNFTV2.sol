// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {EnterpriseNFT} from "./EnterpriseNFT.sol";


contract EnterpriseNFTV2 is EnterpriseNFT { 

    function EnterpriseNFTVVersion() external pure returns (uint256)  {
    return 2;
   }


}


