import "./CostTable.sol";

interface Sentinel {
    // Takes a contract as an input, validates and injects metering statements and returns the upadted version.
    //
    // Note, the Sentinel contract should also accept an incoming call with the `0x0061736D` selector and process
    // it as if it were a non-ABI wrapped call to this function.
    function validateAndMeter(bytes calldata) external view returns (bytes memory);

    // Returns the current CostTable contract.
    function getCostTable() external view returns (CostTable);

    // Replaces the CostTable contract with the specified one.
    //
    // Returns a failure if the setting failed.
    function setCostTable(CostTable) external;
}
