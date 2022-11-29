// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.7;

/**
 * A simple betting contract which allows people to make bets, paying
 * out the lucky person who makes the last bet.  The interesting thing
 * is that there is no benefit to betting the full amount in one go,
 * because you'd just receive your own bet back.  In otherwords, to
 * make any money, you need at least one other player to bet!
 */
contract Betting {
  /**
   * The current betting target.  When this reaches zero, the
   * available balance is paid out.  The target should never be more
   * than one ether.
   */
  uint public target = 0;
  
  /**
   * Make a bet by transfering some ether.  The amount transferred
   * is deducted from the current target.  When the target is
   * reached, the balance is paid out.
   */
  function bet() public payable {
    // Prevent zero bets.
    require(msg.value <= target);
    // Apply the best
    unchecked {
      // NOTE: cannot underflow as msg.value <= target.
      target = target - msg.value;
    }
    // Check if winner
    if(target == 0) {
      // Target reached zero, so pay out.
      payable(msg.sender).transfer(address(this).balance);            
    }
  }
  
  /**
   * Restart betting after someone has won.  Anyone can call this
   * and set the target for the next round.  A limit of one ether is
   * imposed to prevent someone setting an unreasonably large
   * amount.
   */
  function reset(uint newTarget) public {
    // Target cannot exceed 1 eth
    require(newTarget <= 1 ether);
    // Cannot reset unless betting finished.
    require(target == 0);
    // Perform the reset!
    target = newTarget;
  }
}
