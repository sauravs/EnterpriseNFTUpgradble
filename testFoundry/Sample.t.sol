 // tests/Sample.t.sol
import "../contracts/Sample.sol";

contract TestSample {
    Sample public target;

    function setUp() public  {
        target = new Sample(10);
    }

    function testConstructor() public {
        assert(target.getValue() == 10);
    }

    function testIncrement() public {
        target.increment();
        assert(target.getValue() == 11);
    }
}