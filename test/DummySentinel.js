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
  it("validateAndMeter", async () => {
     let instance = await DummySentinel.deployed();
     let input = Buffer.from("0061736d001122334455", "hex");
     let output = await instance.validateAndMeter.call(input);
     assert.equal(input, output);
  })
})
