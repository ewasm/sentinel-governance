const BasicCostTable = artifacts.require('BasicCostTable');

contract('BasicCostTable', async (accounts) => {
  it("getCost(MemoryPage) should work", async () => {
     let instance = await BasicCostTable.deployed();
     let cost = await instance.getCost.call(1);
     assert.equal(cost.valueOf(), 44);
  })
})
