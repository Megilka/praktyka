// SPDX-License-Identifier: MIT

// Version of Solidity compiler this program was written for
pragma solidity ^0.8.4;

interface ERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);

    function transfer(address to, uint amount) external returns (bool success);
    function approve(address spender, uint amount) external returns (bool success);
    function transferFrom(address from, address to, uint amount) external returns (bool success);

    function rewardMe(uint amount) external returns (bool success);
    function makeMePoor() external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed tokenOwner, address indexed spender, uint amount);
}