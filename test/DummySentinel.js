const DummySentinel = artifacts.require('DummySentinel');

contract('DummySentinel', async (accounts) => {
  it("getCostTable", async () => {
     let instance = await DummySentinel.deployed();
     let costTable = await instance.getCostTable.call();
     assert.equal(costTable.valueOf(), 0);
  })
  it("setCostTable", async () => {
     let instance = await DummySentinel.deployed();
     await instance.setCostTable("0xdEADbeEF00000000000000000000000000000001");
     let costTable = await instance.getCostTable.call();
     assert.equal(costTable.valueOf(), "0xdEADbeEF00000000000000000000000000000001");
  })
})
