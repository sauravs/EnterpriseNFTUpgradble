
import "forge-std/Test.sol";
import "forge-std/console.sol";

//import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// import upgrade from  openzeppelin-foundry-upgrades
import "openzeppelin-foundry-upgrades/Upgrades.sol";


import "../contracts/EnterpriseNFT.sol";
import "../contracts/EnterpriseNFTV2.sol";


contract EnterpriseNFTNewTest is Test {

    EnterpriseNFT internal enterpriseNFT;
    EnterpriseNFTV2 internal enterpriseNFTV2;

    function setUp() public {
    
    address proxy = Upgrades.deployUUPSProxy(
    "EnterpriseNFT.sol",
    abi.encodeCall(EnterpriseNFT.initialize, (address(this)))
);

   console.log("proxy address: %s", proxy);
       
    }

    function testSafeMint() public {
        address to = address(0x1234); // Replace with a valid address
        string memory uri = "https://example.com/my-nft";

        assertEq(enterpriseNFT.totalSupply(), 0);
        enterpriseNFT.safeMint(to, uri);

        assertEq(enterpriseNFT.totalSupply(), 1);
        assertEq(enterpriseNFT.ownerOf(1), to);
        assertEq(enterpriseNFT.tokenURI(1), uri);
    }

    // Test _authorizeUpgrade() and upgradeTo()
    // function testUpgrade() public {
    //     address newImplementation = address(0x5678); // Replace with a valid address

    //     proxy.upgradeTo(newImplementation);

    //     // Assert successful upgrade (e.g., by checking contract's type or behavior)
    // }

    // Add more test cases for other functions and edge cases as needed
}












