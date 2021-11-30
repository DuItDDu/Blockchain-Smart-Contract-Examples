// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../libraries/LibDiamond.sol";
import "../interfaces/IERC173.sol";
import "hardhat/console.sol";

contract CardFacet {
    mapping(uint256 => Card) _cards;
    uint256 _cardLength = 0;

    struct Card {
        uint256 id;
        address owner;
        string title;
        string url;
    }

    function createCard(string memory _title, string memory _url) public {
        uint256 cardId = _cardLength;
        _cardLength = _cardLength + 1;

        Card memory newCard = Card(cardId, msg.sender, _title, _url);
        _cards[_cardLength] = newCard;
    }
}
