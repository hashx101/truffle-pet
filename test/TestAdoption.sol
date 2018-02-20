pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
  

  // Test an ID if same for passed in with the one returned in the adopt() function
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);
    uint expected = 8;
    Assert.equal(returnedId, expected, "Adoption of petID 8 should be recorded.");
  }

  // Test retrieval of single pet's owner address
  function testGetAdopterAddressByPetId() public {
    address expected = this; 
    // TestAdoption contract sends the transaction, "this" is a contract-wide variable that gets the current contract's address
    
    address adopter = adoption.adopters(8);
    Assert.equal(adopter, expected, "Owner of petId 8 should be recorded.");
  }

  // Test retrieval of all pet owners' addresses
  function testGetAdopterAddressByPetIdInArray() public {
    // Expected owner is this contract
    address expected = this;

    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();
    // we know from the first adoption test that we adopted pet 8, so compare the testing contracts address with location 8 in the array
    Assert.equal(adopters[8], expected, "Owner of petId 8 should be recorded.");
  }
}




