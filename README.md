# Overview

This is a very simple contract which has been written as a test case
for verification using the
[DafnyEVM](https://github.com/ConsenSys/evm-dafny).  **This contract
is not intended to actually be used in real-life**.  For example, it
is vulnerable to [front
running](https://consensys.github.io/smart-contract-best-practices/attacks/frontrunning/).

The contract has two points of interest from the perspective of
program verification:

   * **(Unchecked Arithmetic)**.  Arithmetic in Solidity is, by
     default, protected against overflow or underflow.  However, many
     contracts (such as this one) use `unchecked` arithmetic to save
     gas.  Therefore, we should be able to verify that, indeed, no
     underflow occurs.

   * **(Contract Invariant)**.  The contract maintains an invariant on
     its storage.  Specifically, that `target <= 1 ether` holds at all
     times.  Therefore, we should be able to verify this invariant
     holds after every contract call.

The contract is deliberately quite simple in order to ease the task of
verifying the above properties.  Nevertheless, it still presents
something of a challenge!

# Yul

The intermediate
[Yul](https://docs.soliditylang.org/en/v0.8.17/yul.html) code
generated by `solc` for this contract is given below.  The exact
command-line used can be determined from the `makefile`.  Observe this
only shows the *runtime* component.

```Yul
object "Betting_68" {
   code {
      {
         mstore(64, memoryguard(0x80))
         if iszero(lt(calldatasize(), 4))
         {
            let _1 := 0
            switch shr(224, calldataload(_1))
            case 0x11610c25 {
               if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
               let _2 := sload(_1)
               if gt(callvalue(), _2) { revert(_1, _1) }
               sstore(_1, sub(_2, callvalue()))
               if eq(_2, callvalue())
               {
                  let expr := selfbalance()
                  let _3 := _1
                  if iszero(expr) { _3 := 2300 }
                  if iszero(call(_3, caller(), expr, _1, _1, _1, _1))
                  {
                     let pos := mload(64)
                     returndatacopy(pos, _1, returndatasize())
                     revert(pos, returndatasize())
                  }
               }
               return(_1, _1)
            }
            case 0x310bd74b {
               if callvalue() { revert(_1, _1) }
               if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
               let value := calldataload(4)
               if gt(value, 0x0de0b6b3a7640000) { revert(_1, _1) }
               if iszero(iszero(sload(_1))) { revert(_1, _1) }
               sstore(_1, value)
               return(_1, _1)
            }
            case 0xd4b83992 {
               if callvalue() { revert(_1, _1) }
               if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
               let _4 := sload(_1)
               let memPos := mload(64)
               mstore(memPos, _4)
               return(memPos, 32)
            }
         }
         revert(0, 0)
      }
   }
}
```

# Bytecode

The raw bytecode string for the runtime component of the contract is given below.

```
60806040526004361060ec576000803560e01c6311610c25811460345763310bd74b811460845763d4b83992811460c45760e9565b81600319360112156043578182fd5b8154803411156050578283fd5b34810383553481036080574783816067576108fc90505b84858687853386f1607d576040513d86823e3d81fd5b50505b8283f35b3415608d578182fd5b602060031936011215609d578182fd5b600435670de0b6b3a764000081111560b3578283fd5b82541560bd578283fd5b8083558283f35b341560cd578182fd5b816003193601121560dc578182fd5b8154604051818152602081f35b50505b600080fd
```
