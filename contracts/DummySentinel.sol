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

    // Note, the Sentinel contract should also accept an incoming call with the `0x0061736D` selector and process
    // it as if it were a non-ABI wrapped call to this function.
    function() external {
        if (msg.sig == 0x0061736d) {
            // NOTE: this isn't the most canonical use case of Solidity,
            // but for simplicity and speed let's do it this way
            assembly {
                // NOTE: this only does a copying as validateAndMeter is doing above
                let free_memory_ptr := mload(0x40)
                let payload_len := sub(calldatasize(), 4)
                calldatacopy(free_memory_ptr, 4, payload_len)
                return(free_memory_ptr, payload_len)
            }
        }
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
