pragma solidity ^0.5.10;
import "https://raw.githubusercontent.com/KMPARDS/NetObjex/token/Mainnet%20deployed/ShahAnchorToken.sol";



contract ERC20Token {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract bank {
    ShahAnchorToken SA;
    constructor(address _SAAddress) public {
        SA = ShahAnchorToken(_SAAddress);
    }
  mapping ( address => uint256 ) public balances;

  function deposit(uint tokens) public{
    // add the deposited tokens into existing balance
     //balances[msg.sender] = balances[msg.sender].add(tokens);
     balances[msg.sender] += tokens;
    // transfer the tokens from the sender to this contract
    SA.transferFrom(msg.sender, address(this), tokens);
  }

//   function updateBalance(uint256 finalBalance) public{
//     balances[msg.sender] = finalBalance;
//   }

  function withdrawFullAmount() public{
      SA.transfer(msg.sender, balances[msg.sender]);
      balances[msg.sender] = 0;
  }

  function withdrawAmount(uint256 amount) public{
      require(balances[msg.sender] > amount);
      SA.transfer(msg.sender, amount);
      balances[msg.sender] -= amount;
    //   updateBalance(balances[msg.sender]);
  }
}