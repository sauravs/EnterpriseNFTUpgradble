

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import {Pizza} from "../contracts/Pizza.sol";
import {PizzaV2} from "../contracts/PizzaV2.sol";

contract PizzaTest is Test {

    Pizza internal pizza;
    PizzaV2 internal pizzaV2;
    ERC1967Proxy internal proxy; // Declare the ERC1967Proxy variable

    function setUp() public {
        pizza = new Pizza();
        pizza.initialize(7, address(this));
        pizzaV2 = new PizzaV2();
        pizzaV2.initialize(7, address(this));
        proxy = new ERC1967Proxy(address(pizza), ""); // Initialize the proxy with the logic contract address and empty 
        pizza.eatSlice();

    }

    function testEat() public {
        assertEq(pizza.slices(), 6);
    }

    function testUpgrade() public {
        pizza.upgradeTo(address(pizzaV2));
        pizza.eatSlice();
        pizzaV2.refillSlice();
       
        assertEq(pizza.slices(), 5);
    }

    function testUpgradeFail() public {
        pizza.upgradeTo(address(pizzaV2));
        pizza.eatSlice();   
        pizzaV2.refillSlice();
        assertEq(pizza.slices(), 5);

    }

    // function testUpgrade2Fail() public {
    //        vm.prank(address(0));
    //        pizza.upgradeTo(address(pizzaV2));
    //        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        
    //  }





    // function testUpgradeFail() public {
    //     vm.expectRevert(bytes("Ownable: caller is not the owner"));
    //     vm.prank(address(2));
    //     pizza.upgradeTo(address(pizzaV2));
    // }


}