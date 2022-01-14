// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface pancake_router_interface {
    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );

    //  function addLiquidity(
    //         address token,
    //         uint liquidity,
    //         uint amountTokenMin,
    //         uint amountETHMin,
    //         address to,
    //         uint deadline
    //  ) returns (uint amountToken, uint amountETH, uint liquidity);
}

interface token_interface {
    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
}

contract IntractingContract {
    address public pancake_factory_address;
    address public token_address;
    address public pancake_router_address;
    address public WBNB_address;
    address public tokenA;
    address public tokenB = WBNB_address;

    constructor(
        address pancake_factory,
        address pancake_router,
        address token,
        address WBNB
    ) {
        pancake_factory_address = pancake_factory;
        pancake_router_address = pancake_router;
        token_address = token;
        tokenA = token;
        WBNB_address = WBNB;
    }

    function addLiquidity(uint256 amountA, uint256 amountB) external {
        token_interface(tokenA).transferFrom(
            msg.sender,
            address(this),
            amountA
        );
        token_interface(tokenB).transferFrom(
            msg.sender,
            address(this),
            amountB
        );
        token_interface(tokenA).approve(pancake_router_address, amountA);
        token_interface(tokenB).approve(pancake_router_address, amountB);

        pancake_router_interface(pancake_router_address).addLiquidity(
            tokenA,
            tokenB,
            amountA,
            amountB,
            0,
            0,
            address(this),
            block.timestamp + 1000000
        );
    }
    /*
    
    function addLiq(address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline) public payable {
        
        token_interface(token).approve(pancake_router_address, amountTokenDesired);
        pancake_router_interface(pancake_router_address).addLiquidityETH(token, amountTokenDesired, amountTokenMin, amountETHMin, to, deadline);
    }

    function run() public {
        addLiq(token_address, 100, 50, 100000000000000000, msg.sender,  block.timestamp + 100000);
    }
*/
}

/*
function addLiquidity
address tokenA,
address tokens,
uint256 amountAdesired,
uint256 amountDesired,
uint256 amountAmin,
uint256 amountВMin,
address to,
uint256 deadline
external
returns (
uint256 amounta,
uint256 amount,
uint256 liquidity
);

*/
