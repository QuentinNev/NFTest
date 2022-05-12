// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenID;

    // @dev Base otken URI used as a prefix by tokenURI()
    string public baseTokenURI;

    constructor() ERC721("NFTest", "NFT") 
    {
        baseTokenURI = "";
    }

    function mintTo(address recipient) public returns (uint256) {
        currentTokenID.increment();
        uint256 newItemID = currentTokenID.current();

        _safeMint(recipient, newItemID);
        return newItemID;
    }

    // @dev Returns an URI for a given token ID
    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    // @dev Sets the base toekn URI prefix
    function setBaseTokenURI(string memory _baseTokenURI) public 
    {
        baseTokenURI = _baseTokenURI;
    }
}
