pragma solidity ^0.4.17;

contract Adoption{

  address[16] public adopters; // array of ethereum addresses

  // Adopting a pet
  function adopt(uint petId) public returns (uint){
    require(petId >= 0 && petId <= 15);

    adopters[petId] = msg.sender; // address of the person/smart contract who called this function

    return petId;
  }

  // Retrieve adopters
  // what is view for?
  function getAdopters() public view returns (address[16]){
    return adopters;

  }

}
