// SPDX-License-Identifier: GPLv3

pragma solidity ^0.8.19;

// - receive
// - fallback
// - external
// - public
// - internal
// - private
// - view / pure

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        // some logic that returns a string that is the name of the token
        return "Manual Token";
    }

    function symbol() public pure returns (string memory) {
        // some logic that returns a string that is the ticker of the token
        return "$MT";
    }

    function decimals() public pure returns (uint8) {
        // some logic that returns the number of decimals in the ManualToken
        // I am not sure exactly how this matters; I realize that solidity doesn't have floating point numbers but it isn't quite clear to me why the number of decimals should be included in the fuction in the first place
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        // some logic that returns the total supply;
        // some other function probably is the one that defines the total supply and perhaps who is allowed to change it and under what conditions.
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        // some logic that returns the balance of a given address; presumably this pulls from some array somehow...?
        return s_balances[_owner];
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        // a transfer fuction that returns a boolean if the logical conditions are met
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        // I think this probably is only used for 'allowance' transactions to be called by an address other than msg.sender?
        // This function must also call the transfer function
    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        // this is a function to check if the address making the call has been approved for some amount. it should probably be called in the transferFrom function, no?
    }

    function allowance(
        address _owner,
        address _spender
    ) public view returns (uint256 remaining) {}
    //
    // event Transfer(address indexed _from, address indexed _to, uint256 _value) {}
    //
    // event Approval(address indexed _owner, address indexed _spender, uint256 _value) {}
}
