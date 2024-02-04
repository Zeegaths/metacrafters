// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 
contract Errorhandling {
    uint public balance;

    function deposit (uint _amount) public payable{
        //ensures the user enters a valid amount otherwise revert the transaction
        require(_amount >= 0, "amount has to be greater than 0");
        
        //rolls back the transaction if the condition is not met
        if (_amount >= 10000) {
            revert("Amount exceeds maximum limit");
        }

        //balance updates if condition are met
        balance += _amount;
    }

    function withdraw(uint amount) public {
        // If the amount is greater than the balance, the transaction is reverted.
        assert(balance >= amount);

        // Updating balance if the assert condition is true
        balance -= amount;
    }


}