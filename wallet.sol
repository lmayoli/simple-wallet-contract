// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleWallet{
    address payable owner;
    address payable reciever;
    uint amount;
    
    constructor()payable{
        owner=payable(msg.sender);
    }
    event send(uint _amount, address to );
    event deposit(uint _amount, address from);
    
    function getBalance() public view returns(uint){
        return(address(this).balance);
    }
    function sendCash(uint _amount)public payable {
        if (owner.balance > _amount)
        emit send(_amount, reciever );
        owner.transfer(_amount);
    }
    function makeDeposit(uint _amount) public payable{
        if (msg.sender == owner)
        emit deposit(msg.value, owner);
        owner.transfer(_amount);
    }
}
