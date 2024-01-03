import "forge-std/Test.sol";
import "forge-std/console.sol";

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import "../contracts/EnterpriseNFT.sol";
import "../contracts/EnterpriseNFTV2.sol";


contract EnterpriseNFTOldTest is Test {


    EnterpriseNFT internal enterpriseNFT;
    EnterpriseNFTV2 internal enterpriseNFTV2;

        ERC1967Proxy internal proxy; // Declare the ERC1967Proxy variable

    
    function setUp() public {

    enterpriseNFT = new EnterpriseNFT();
    enterpriseNFT.initialize(address(this));
    enterpriseNFTV2 = new EnterpriseNFTV2();
    enterpriseNFTV2.initialize(address(this));
    proxy = new ERC1967Proxy(address(enterpriseNFT), ""); // Initialize the proxy with the logic contract address and empty

    }


    function testsafeMint() public {

        address to = address(0x1234); // Replace with a valid address
        string memory uri = "https://example.com/my-nft";

        assertEq(enterpriseNFT.totalSupply(), 0);
        enterpriseNFT.safeMint(to, uri);

        assertEq(enterpriseNFT.totalSupply(), 1);
        assertEq(enterpriseNFT.ownerOf(1), to);
        assertEq(enterpriseNFT.tokenURI(1), uri);
    }

    function testUpgrade() public {
        enterpriseNFT.upgradeTo(address(enterpriseNFTV2));
        enterpriseNFT.safeMint(address(this), "https://example.com/my-nft");
        enterpriseNFTV2.safeMint(address(this), "https://example.com/my-nft");
        assertEq(enterpriseNFT.totalSupply(), 1);
        assertEq(enterpriseNFTV2.totalSupply(), 1);
        assertEq(enterpriseNFT.ownerOf(1), address(this));
        assertEq(enterpriseNFTV2.ownerOf(1), address(this));
        assertEq(enterpriseNFT.tokenURI(1), "https://example.com/my-nft");
        assertEq(enterpriseNFTV2.tokenURI(1), "https://example.com/my-nft");
    }



}