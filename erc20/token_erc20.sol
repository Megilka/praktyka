// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity ^0.8.4;

import "erc20/erc20_interface.sol";

contract TokenErc20 is ERC20 {
    uint256 public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    function transfer(address to, uint amount) external returns (bool success) {
        if (!_burn(msg.sender, amount)) {
            return false;
        }

        _mint(msg.sender, amount);

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool success) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint amount) external returns (bool success) {
        if (allowance[from][msg.sender] < amount) {
            return false;
        }

        if (!_burn(from, amount)) {
            return false;
        }

        allowance[from][msg.sender] = 0;
        _mint(to, amount);

        emit Transfer(from, to, amount);
        return true;
    }

    function _mint(address person, uint amount) internal {
        totalSupply += amount;
        balanceOf[person] += amount;
    }

    function _burn(address person, uint amount) internal returns (bool success) {
        if (balanceOf[person] < amount) {
            return false;
        }

        totalSupply -= amount;
        balanceOf[person] -= amount;
        return true;
    }

    function rewardMe(uint amount) external returns (bool success) {
        require(amount <= 100);

        _mint(msg.sender, amount);

        emit Transfer(address(0), msg.sender, amount);
        return true;
    }

    function makeMePoor() external returns (bool success) {
        uint amount = balanceOf[msg.sender];

        if(!_burn(msg.sender, amount)) {
            return false;
        }

        emit Transfer(msg.sender, address(0), amount);
        return true;
    }
}