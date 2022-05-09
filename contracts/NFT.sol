// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenID;

    constructor() ERC721("NFTest", "NFT") {}

    function mintTo(address recipient) public returns (uint256) {
        currentTokenID.increment();
        uint256 newItemID = currentTokenID.current();

        _safeMint(recipient, newItemID);
        return newItemID;
    }
}
