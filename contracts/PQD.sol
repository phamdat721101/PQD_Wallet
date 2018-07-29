pragma solidity ^0.4.10;
contract PQD{
    address owner;
    uint totalSupply;
    //create the mapping to check the balance
    mapping(address=> uint) balanceOf;
    //create the event to show data of transaction
    event Transfer(address from, address to, uint value);
    //create the event to withdraw
    event Withdraw(address person, uint amount);
    //create the object of provider
    function _PQD() public{
        owner=msg.sender;
        totalSupply=5000;
    }
    //create the method to public token
    function supply() public{
        balanceOf[msg.sender]+=totalSupply;
    }
    //create the method to buy token
    function buyPQD(address buyer, uint amount) public{
        require(msg.sender==owner);
        require(balanceOf[msg.sender]>amount);
        balanceOf[buyer]+=amount;
        balanceOf[msg.sender]-=amount;
        Transfer(msg.sender,buyer,amount);
    }
    //create the method to check balance
    function balance(address acc) public constant returns(uint){
        return balanceOf[acc];
    }
    //create the method to trader the token
    function trader(address _from, address _to, uint value) public payable{
        require(_from!=msg.sender);
        require(balanceOf[_from]>value);
        balanceOf[_from]-=value;
        balanceOf[_to]+=value;
        Transfer(_from,_to,value);
    }
    //create the method to withdraw
    function withdraw(address _owner, uint value) public payable{
        require(_owner!=msg.sender);
        require(balanceOf[_owner]>=value);
        balanceOf[_owner]-=value;
        Withdraw(_owner,value);
    }
}