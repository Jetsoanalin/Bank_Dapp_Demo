# Shah And Anchor College Blockchain Demo


- What is Solidity
- Implementation of a basic Smart contract in Ethereum Blockchain


# Blocklogy EduTech
###### Demo by Jetso Analin - Blockchain Developer

<center> <img src="https://lh3.googleusercontent.com/QlQqejAQbV6b1oVX5ps2gG9QNROpAAGqnWLzTtA3iCSflBQ5uLprpOl2qdXO3WwHsUg" alt="Blocklogy"> </center>




### What is Solidity
                
---

Solidity is the main programming language for writing smart contracts for the Ethereum blockchain. It is a contract-oriented language, which means that smart contracts are responsible for storing all of the programming logic that transacts with the blockchain. It's a high-level programming language that looks a lot like JavaScript, Python, and C++. It's designed to run on the Ethereum Virtual Machine (EVM), which is hosted on Ethereum Nodes that are connected to the blockchain. It is statically typed, and supports inheritance, libraries, and more! In short, it has all the capability that you need in order build industrial strength blockchain applications.

##### Remix Solidity IDE
We're going to use Remix to write all of the code in this tutorial. Remix is a browser-based IDE that allows you to write, compile, deploy smart contracts! It has a lot of nice features like persistent file storage! We'll use Remix so that we don't have to download any developer tools or install anything to get started. Head on over to Remix in a new tab in order to follow along with this tutorial.

Let's start by creating a new file to write some Solidity code. You can do this in the file browser on the left hand side of the screen.

New Solidity File
Let's create a new file named MyContract.sol. On the first line of this file, we'll declare the version of the solidity programming language we want to use:

```
pragma solidity ^0.5.1;
Now we can declare the smart contract like this:

pragma solidity ^0.5.1;
contract MyContract {
    // ...
}
```
Let me explain a few things before we continue. A smart contract is a piece of code that gets executed on the Ethereum blockchain. It functions somewhat like an API microservice on the web that is publicly accessible to everyone. All of the code of the smart contract is visible to the public, and we can allow anyone connected to the network to call functions on the smart contract.

Now let's continue building out this smart contract. First, we'll program a simple "storage" smart contract that will be able to:

Store a value
Retrieve this value
We'll start by creating a way to store a string value in the smart contract like this. We'll do that with a variable called value. Solidity is a statically typed language, so we must first specify the data type when declaring the variable like this:

```
pragma solidity ^0.5.1;
contract MyContract {
    string value;

}
```
This variable is called a "state variable" because it actually persists data to the blockchain. Anytime that we set this value, the string will be saved to the blockchain! It will get written to storage, not memory. This variable also has special scope, as it is accessible to the entire smart contract unlike a local variable which is only accessible inside of functions, and will not persist after the function has been called. We'll see more examples of this as we continue along with this tutorial.

Now let's create a function to read this value from storage. We'll start by declaring a function called get() with the function keyword like this:

```
function get() {
    // ...
}
```
Now we'll return the value from the state variable with the return keyword like this:

```
function get() {
    return value;
}
```
Now we'll set the "visibility" of this function to public so that anyone connected to the blockchain can call it (not just from within the smart contract code itself):

```
function get() public view {
    return value;
}
```
Finally, we'll specify the return value string for the function:
```
function get() public view returns(string memory) {
    return value;
}
```
Awesome! Now we have a way to read this value from the smart contract. I'll show you how to do this after we compile it momentarily. Before we get there, let's create a way to set this value from outside the smart contract. We'll create a set function like this:
```
function set(string memory _value) public {
    // ...
}
```
We simply created a function that accepts a _value argument of string type. This function is also publicly visible so that anyone connected to the blockchain can call it. Now let's actually update the smart contract value like this:
```
function set(string memory _value) public {
    value = _value;
}
```
Here we simply assigned the passed in ```_value``` and assigned it to the value state variable. Notice that _value, prepended by an underscore is simply a local variable. This is a common convention when writing Solidity code, as well as other languages.


Compiler Version
Now, let's choose the environment. I'll select the Injected web3, which will use Metamask for signing.

Deploy Smart Contract Button
Awesome! You've just deployed the smart contract. You can interact with the smart contract by calling its functions below, with the form that was generated based upon the smart contract's interface.

Smart Contract Functions
First, let's read the value. Let's click the ```get()``` function. You should see the default ```"myValue"``` that was set in the constructor.

Now let's update the value with the ```set()``` function. Add a new value inside the form field, just make sure that you wrap it in quotation marks like this: "New Value". Now run it! Now read the value again. It should changed to "New Value"!

Blockchain Transaction History
You might have noticed this transaction window below the text editor. This is a complete list of all the transactions on this virtual blockchain. Remember, the Etherum blockchain is made up of bundles of records called "blocks" which are "chained together" to make up the public ledger. The basic units of all these blocks are transactions. You're seeing them listed here below. You can click the "down" arrow to see all details of the receipt.


# Small Bank Application of deposit and withdrawal

```
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
```


# For More info Download Blocklogy App now

<a href= "https://play.google.com/store/apps/details?id=com.blocklogy.blocklogyapp"><img width=50px height=50px src="https://mondrian.mashable.com/uploads%252Fcard%252Fimage%252F475500%252Ff018ae30-f60a-43b7-a3fd-d9acec74849e.png%252Ffull-fit-in__950x534.png?signature=T8lnjwshIlXsatf7BSwU-PhthKQ=&source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com" alt="Blocklogy"> </a>


