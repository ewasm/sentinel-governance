const BasicCostTable = artifacts.require('BasicCostTable');

contract('BasicCostTable', async (accounts) => {
  let instance;

  beforeEach(async () => {
    instance = await BasicCostTable.new();
  });

  it("getCost(MemoryPage) should work", async () => {
     let cost = await instance.getCost(1);
     assert.equal(cost.valueOf(), 44);
  })
})
