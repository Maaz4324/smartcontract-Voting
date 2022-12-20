// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract TokenMarketplace {
    struct token{
        string name;
        uint price;
        string symbol;
        address owner;
    }

    token[] public tokens;

    function mint(string memory _name, uint _price, string memory _symbol) public {
        tokens.push(token(_name, _price, _symbol, msg.sender));
    }

    function buyToken(uint _id, uint _newPrice) public payable{
        payable(address(tokens[_id].owner)).transfer(tokens[_id].price);
        tokens[_id].price = _newPrice;
        tokens[_id].owner = msg.sender;
    }

}
