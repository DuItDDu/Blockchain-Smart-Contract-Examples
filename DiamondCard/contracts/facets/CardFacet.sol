// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../libraries/LibDiamond.sol";
import "hardhat/console.sol";

contract CardFacet {
    function createCard(string memory _title, string memory _url) public {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        uint256 cardId = ds.cardCount + 1;
        ds.cardCount = cardId;

        LibDiamond.Card memory newCard = LibDiamond.Card(cardId, msg.sender, _title, _url);
        ds.cards[cardId] = newCard;
    }

    function getCardCounts() public view returns (uint256) {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.cardCount;
    }

    function supportsInterface(bytes4 _interfaceID) external view returns (bool) {}
}
