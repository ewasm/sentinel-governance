interface CostTable {
    enum CostKind {
        BaseInstantiation,
        MemoryPage,
        I32Add,
        I32Sub,
        I32Mul,
        I32Div,
        I32Mod
        // TBA
    }

    // Returns the cost for the given kind.
    function getCost(CostKind kind) external view returns (uint64);

    // Returns all the costs as an array, in order the enum is defined above.
    function getAllCosts() external view returns (uint64[] memory);
}
