pragma solidity ^0.5.10;
import "./shahanchor.sol";

contract bank {
    ShahAnchorToken SA;
    constructor(address _SAAddress) public {
        SA = ShahAnchorToken(_SAAddress);
    }
  mapping ( address => uint256 ) public balances;

  function deposit(uint256 tokens) public{
    // add the deposited tokens into existing balance
     balances[msg.sender] += tokens;
    // transfer the tokens from the sender to this contract
    SA.transferFrom(msg.sender, address(this), tokens);
  }

  function withdrawFullAmount() public{
      SA.transfer(msg.sender, balances[msg.sender]);
      balances[msg.sender] = 0;
  }
  
  function withdrawAmount(uint256 amount) public{
      require(balances[msg.sender] > amount);
      SA.transfer(msg.sender, amount);
      balances[msg.sender] -= amount;
  }
}
