import "./Sentinel.sol";

contract SentinelProxy is Sentinel {
    address m_owner;
    CostTable m_costTable;
    Sentinel m_destination;

    constructor() public {
        m_owner = msg.sender;
    }

    function setOwner() external {
        require(m_owner == msg.sender);
        m_owner = msg.sender;
    }

    // Takes a contract as an input, validates and injects metering statements and returns the upadted version.
    function validateAndMeter(bytes memory input) public view returns (bytes memory output) {
        return m_destination.validateAndMeter(input);
    }

    // Note, the Sentinel contract should also accept an incoming call with the `0x0061736D` selector and process
    // it as if it were a non-ABI wrapped call to this function.
    function() external {
        if (msg.sig == 0x0061736d) {
            bytes memory input;

            uint size;
            assembly {
                size := calldatasize()

                // These instructions correspond to `bytes memory input = new bytes[size]`
                // Point input at the free memoy pointer
                input := mload(0x40)
                // Set the size of input
                mstore(input, size)
                mstore(0x40, add(input, add(size, 32)))

                calldatacopy(add(input, 32), 0, size)
            }

            bytes memory output = validateAndMeter(input);
            uint output_size = output.length;

            // NOTE: this isn't the most canonical use case of Solidity,
            // but for simplicity and speed let's do it this way
            assembly {
                return(add(output, 32), output_size)
            }
        }
    }

    // Returns the current CostTable contract.
    function getCostTable() external view returns (CostTable costTable) {
        return m_destination.getCostTable();
    }

    // Replaces the CostTable contract with the specified one.
    //
    // Returns a failure if the setting failed.
    function setCostTable(CostTable costTable) external {
        require(m_owner == msg.sender);
        m_destination.setCostTable(costTable);
    }
}
