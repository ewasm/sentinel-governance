import "./Sentinel.sol";

contract DummySentinel is Sentinel {
    CostTable m_costTable;
    address m_owner;

    constructor() public {
        m_owner = msg.sender;
    }

    // Takes a contract as an input, validates and injects metering statements and returns the upadted version.
    function validateAndMeter(bytes calldata input) external view returns (bytes memory output) {
        output = input;
    }

    // Returns the current CostTable contract.
    function getCostTable() external view returns (CostTable costTable) {
        costTable = m_costTable;
    }

    // Replaces the CostTable contract with the specified one.
    //
    // Returns a failure if the setting failed.
    function setCostTable(CostTable costTable) external {
        require(m_owner == msg.sender);
        m_costTable = costTable;
    }
}
