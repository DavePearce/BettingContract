include "../../evm-dafny/src/dafny/evm.dfy"
include "../../evm-dafny/src/dafny/core/code.dfy"
include "Betting_0_header.dfy"

module util {
	import opened Opcode
	import opened Code
	import opened Memory
	import opened Bytecode
	import opened Header

	method block_0_0x0041(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0041
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 1
	{
		var st := st';
		// |fp=0x0080|_|
		st := JumpDest(st);
		// |fp=0x0080|_|
		st := Stop(st);
		return st;
	}

}
