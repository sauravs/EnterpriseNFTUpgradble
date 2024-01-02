// SPDX-License-Identifier: UNLICENSED


import "../contracts/Lock.sol";

contract TestLock {
    Lock public target;

    function setUp() public  {
        target = new Lock(1);
    }

  //test constructor    
    
    function testConstructor() public {
        assert(target.unlockTime() == 1);
        assert(target.owner() == address(this));
    }
    // test withdraw function
    function testWithdraw() public {
        target.withdraw();
        assert(target.unlockTime() == 100000);
        assert(target.owner() == address(this));
    }


}