// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.7;

/**
 * A simple betting contract which allows people to make bets, paying
 * out the lucky person who makes the last bet.  The interesting thing
 * is that there is no benefit to betting the full amount in one go,
 * because you'd just receive your own bet back.  In otherwords, to
 * make any money, you need at least one other player to bet!
 *
 * The contract currently contains bug in that money can end up being
 * locked into the contract forever!
 */
contract Betting {
    uint public counter = 1000;

    function bet() public payable {
        // Prevent zero bets.
        require(msg.value <= counter);
        // Apply the best
        unchecked {
            // NOTE: cannot underflow as msg.value <= counter.
            counter = counter - msg.value;
        }
        // Check if winner
        if(counter == 0) {
            // Counter reached zero, so pay out.
            payable(msg.sender).transfer(address(this).balance);
            // Reset counter
            counter = 1000;
        } 
    }
}
