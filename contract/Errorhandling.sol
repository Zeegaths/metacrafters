// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 
contract SchoolRegister{
    address public principal;

    struct Teachers{
        string Name;
        uint8 Age;
        address teacherA;
    }

//mapping address to struct
    mapping(address => Teachers) register;

    constructor() {
        principal = msg.sender;
    }

    function registerTeacher (string memory _Name, uint8 _age, address _teacherAddress) public {
        require(principal == msg.sender, "You have to be the principal to add a teacher");
        //ensure the teacher address does not exist
        assert(register[_teacherAddress].teacherA != address(0));
        register[_teacherAddress] = Teachers(_Name, _age , _teacherAddress); 
              
    }

    function deleteTeacher(address _teacherAddress) public  {
         if (principal != msg.sender) {
        revert("Cannot perfom this action");  
        }
     delete register[_teacherAddress];
    }
}