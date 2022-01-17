// SPDX-License-Identifier: MIT
//  OpenZeppelin Contracts v4.4.1 (token/ERC20/ERC20.sol)
pragma solidity ^0.8.0;
import "OpenZeppelin/openzeppelin-contracts@4.4.1/contracts/token/ERC20/ERC20.sol";


// Token - is a token with name - TokenA & Sym - TKNA
 contract Token is ERC20 {

     //## on BSC testnet ##

    // //not needed
    // address pancake_router= 0x9ac64cc6e4415144c455bd8e4837fea55603e5c3;

    // //needed
    // address WBNB_address = 0xae13d989dac2f0debff460ac112a837c89baa7cd;
    // address pancake_factory = 0xB7926C0430Afb07AA7DEfDE6DA862aE0Bde767bc;
    
    
    
    address payable[] public players;

    address public owner  = msg.sender; 
 
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(owner,100 * 10**18);
        // 100 * 10**18
    }
    function retrive_owner() external view returns (address) {
        return owner;
    }
 } 

