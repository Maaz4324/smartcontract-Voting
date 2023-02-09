// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Coin{
    address public minter;

    mapping(address=>uint) public balance;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address _recipient, uint _amount) public {
        require(msg.sender==minter);
        balance[_recipient] += _amount;
    }

    function send(address _receiver, uint _amount) public{
        require(_amount<=balance[msg.sender]);
        balance[_receiver]+=_amount;
        balance[msg.sender]-=_amount;
        emit Sent(msg.sender, _receiver, _amount);
    }
}
