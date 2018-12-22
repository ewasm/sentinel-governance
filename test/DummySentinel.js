const DummySentinel = artifacts.require('DummySentinel');

contract('DummySentinel', async (accounts) => {
  let instance;

  beforeEach(async () => {
    instance = await DummySentinel.new();
  });

  it("getCostTable", async () => {
     let costTable = await instance.getCostTable();
     assert.equal(costTable.valueOf(), 0);
  })
  it("setCostTable", async () => {
     await instance.setCostTable("0xdEADbeEF00000000000000000000000000000001");
     let costTable = await instance.getCostTable();
     assert.equal(costTable.valueOf(), "0xdEADbeEF00000000000000000000000000000001");
  })
})
