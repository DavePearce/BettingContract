include "../../evm-dafny/src/dafny/evm.dfy"
include "../../evm-dafny/src/dafny/core/code.dfy"
include "Betting_0_header.dfy"

module target {
	import opened Opcode
	import opened Code
	import opened Memory
	import opened Bytecode
	import opened Header

	method block_0_0x0063(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0063
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 1
	{
		var st := st';
		// |fp=0x0080|_|
		st := JumpDest(st);
		// |fp=0x0080|_|
		st := CallValue(st);
		// |fp=0x0080|_,_|
		st := Dup(st,1);
		// |fp=0x0080|_,_,_|
		st := IsZero(st);
		// |fp=0x0080|_,_,_|
		st := Push2(st,0x006f);
		// |fp=0x0080|0x6f,_,_,_|
		assume st.IsJumpDest(0x6f);
		st := JumpI(st);
		if st.PC() == 0x6f { st := block_0_0x006f(st); return st;}
		// |fp=0x0080|_,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_,_|
		st := Dup(st,1);
		st := block_0_0x006e(st);
		return st;
	}

	method block_0_0x006e(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x006e
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 4
	// Static stack items
	requires (st'.Peek(0) == 0x0 && st'.Peek(1) == 0x0)
	{
		var st := st';
		// |fp=0x0080|0x00,0x00,_,_|
		st := Revert(st);
		return st;
	}

	method block_0_0x006f(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x006f
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 2
	{
		var st := st';
		// |fp=0x0080|_,_|
		st := JumpDest(st);
		// |fp=0x0080|_,_|
		st := Pop(st);
		// |fp=0x0080|_|
		st := Push2(st,0x0079);
		// |fp=0x0080|0x79,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x79,_|
		st := SLoad(st);
		// |fp=0x0080|_,0x79,_|
		st := Dup(st,2);
		// |fp=0x0080|0x79,_,0x79,_|
		assume st.IsJumpDest(0x79);
		st := Jump(st);
		st := block_0_0x0079(st);
		return st;
	}

	method block_0_0x0079(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0079
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(1) == 0x79)
	{
		var st := st';
		// |fp=0x0080|_,0x79,_|
		st := JumpDest(st);
		// |fp=0x0080|_,0x79,_|
		st := Push1(st,0x40);
		// |fp=0x0080|0x40,_,0x79,_|
		st := MLoad(st);
		// |fp=0x0080|0x80,_,0x79,_|
		st := Swap(st,1);
		// |fp=0x0080|_,0x80,0x79,_|
		st := Dup(st,2);
		// |fp=0x0080|0x80,_,0x80,0x79,_|
		st := MStore(st);
		// |fp=0x0080|0x80,0x79,_|
		st := Push1(st,0x20);
		// |fp=0x0080|0x20,0x80,0x79,_|
		st := Add(st);
		st := block_0_0x0083(st);
		return st;
	}

	method block_0_0x0083(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0083
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(0) == 0xa0 && st'.Peek(1) == 0x79)
	{
		var st := st';
		// |fp=0x0080|0xa0,0x79,_|
		st := Push1(st,0x40);
		// |fp=0x0080|0x40,0xa0,0x79,_|
		st := MLoad(st);
		// |fp=0x0080|0x80,0xa0,0x79,_|
		st := Dup(st,1);
		// |fp=0x0080|0x80,0x80,0xa0,0x79,_|
		st := Swap(st,2);
		// |fp=0x0080|0xa0,0x80,0x80,0x79,_|
		st := Sub(st);
		// |fp=0x0080|0x20,0x80,0x79,_|
		st := Swap(st,1);
		// |fp=0x0080|0x80,0x20,0x79,_|
		st := Return(st);
		return st;
	}

}
