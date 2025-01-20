// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Owned {
    address public owner;

    constructor() {
        owner = msg.sender;

    }

    function setOwner(address _owner) public virtual {
        owner = payable(_owner);
    }
}

abstract contract C {
    function get() virtual public;
}
abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}



contract Mortal is Owned,A{
   uint public b;

    constructor() A(1) {
        b = 2;
    }
}

