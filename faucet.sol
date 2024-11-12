// SPDX-License-Identifier: MIT

// Version of Solidity compiler this program was written for
pragma solidity ^0.8.4;

// Pierwszy kontrakt działa jak kran.
contract Faucet {
    // Przekazuje ethery na dowolny wskazany adres.
    function withdraw(uint withdraw_amount) public {
        // Ograniczanie żądanej kwoty.
        require(withdraw_amount <= 100000000000000000);
        // Przekazywanie środków na wskazany adres.
        payable(msg.sender).transfer(withdraw_amount);
    }
    // Przyjmuje dowolną przesyłaną kwotę.
    receive () external payable {}
}