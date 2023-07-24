// SPDX-License-Identifier: MIT

//set the compiler version
pragma solidity ^0.5.16;

// step 1: create a contract
contract Escrow{
    
    //create an Ethereum address for our escrow agent
    address agent;

    //step-4: store the deposits in the escrow
    mapping(address => uint256) public deposits;

    // Step 6: For security, make sure only agent can do all this
    // onlyAgent() is a function modifier
    modifier onlyAgent(){
        require(msg.sender == agent);
        _;
    }
 //step 2: create a constructor that runs when the contract is deployed
    constructor() public  {   
        // msg is a global variable in Ethereum
        agent = msg.sender; 
    }
    // step 3: create the deposit function
    function deposit(address payee) public onlyAgent payable {
        uint256 amount = msg.value;
        
        //add all deposits to the escrow
        deposits[payee] = deposits[payee] + amount; 
    }
    //step 5: create a withdraw function
    function withdraw(address payable payee) public onlyAgent {
        uint256 payment = deposits[payee];
        
        //deduct the money from the escrow
        deposits[payee] = 0;
        //transfer it to payee
        payee.transfer(payment);
    }
}