pragma solidity ^0.5.0;

import "./CostTable.sol";

contract BasicCostTable is CostTable {
    function getCost(CostKind kind) external view returns (uint64) {
        if (kind == CostKind.MemoryPage)
            return 44;
        else
            return 1;
    }

    function getAllCosts() external view returns (uint64[] memory) {
    }
}
