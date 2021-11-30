const { expect } = require("chai");

describe("CardFacet contract", function () {
  let cardContract;
  let cardFacet;

  beforeEach(async function () {
    cardContract = await ethers.getContractFactory("CardFacet");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    cardFacet = await cardContract.deploy();
  });

  describe("createCard", function () {
    it("createCard", async function () {
      // Transfer 50 tokens from owner to addr1
      await cardFacet.createCard("title1", "url1");
      await cardFacet.createCard("title2", "url2");
    });
  });
});