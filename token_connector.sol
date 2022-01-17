// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface pancake_factory_interface{
        function createPair(address tokenA, address tokenB) external returns (address pair);
}

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
}

interface token_interface {
    function approve(address spender, uint256 amount) external returns (bool);

    function transferfrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function retrive_owner() external view returns (address);
}

interface usdc_interface {
    function balanceOf(address account) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferfrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
}

contract IntractingContract {
    address public constant usdc_address =
        0x64544969ed7EBf5f083679233325356EbE738930;
    address public pancake_factory_address;
    address public token_address;
    address public pancake_router_address;
    address public WBNB_address;
    address public tokenA;
    // address public tokenB = WBNB_address;
    address public tokenB =  usdc_address;

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

    // function createpair() public returns (address pair){
    //     pair = pancake_factory_interface(pancake_factory_address).createPair(tokenA , tokenB);
    //     return pair;
    // }

    function addLiquidity(uint256 amountA, uint256 amountB) public returns (address pair)  {
       pair = pancake_factory_interface(pancake_factory_address).createPair(tokenA , tokenB);
        token_interface(tokenA).approve(pancake_router_address, amountA);
        token_interface(tokenB).approve(pancake_router_address, amountB);
        token_interface(tokenA).transferfrom(
            msg.sender,
            pancake_router_address,
            amountA
        );
        token_interface(tokenB).transferfrom(
            msg.sender,
            pancake_router_address,
            amountB
        );

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
        return pair;
    }

    function s1(address account) public view returns(uint) {

        return usdc_interface(usdc_address).balanceOf(account); 
           
    }
    //     token_interface(tokenA).approve(address(this), amountA);
    // }

    // function s2(uint256 amountA) public {
    //     // token_interface(tokenA).transferFrom(
    //     //     token_interface(tokenA).retrive_owner(),
    //     //     pancake_router_address,
    //     //     amountA
    //     // );
    //         token_interface(tokenA).transferfrom(
    //         msg.sender,
    //         address(this),
    //         amountA
    //     );

    // }
    // function s3(uint256 amountA, uint256 amountB) public {

    //     token_interface(tokenB).transferfrom(
    //         msg.sender,
    //         pancake_router_address,
    //         amountB
    //     );
    // }

    // function s4(uint256 amountA, uint256 amountB) public {

    //     token_interface(tokenB).approve(pancake_router_address, amountB);

    // }
    // function s5(uint256 amountA, uint256 amountB) public {

    //     pancake_router_interface(pancake_router_address).addLiquidity(
    //         tokenA,
    //         tokenB,
    //         amountA,
    //         amountB,
    //         0,
    //         0,
    //         address(this),
    //         block.timestamp + 1000000
    //     );
    // }

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
