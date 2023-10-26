include "../../evm-dafny/src/dafny/evm.dfy"
include "../../evm-dafny/src/dafny/core/code.dfy"
include "Betting_0_header.dfy"
include "Betting_0_util.dfy"

module reset {
	import opened Opcode
	import opened Code
	import opened Memory
	import opened Bytecode
	import opened Header
	import opened util

	method block_0_0x0043(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0043
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
		st := Push2(st,0x004f);
		// |fp=0x0080|0x4f,_,_,_|
		assume st.IsJumpDest(0x4f);
		st := JumpI(st);
		if st.PC() == 0x4f { st := block_0_0x004f(st); return st;}
		// |fp=0x0080|_,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_,_|
		st := Dup(st,1);
		st := block_0_0x004e(st);
		return st;
	}

	method block_0_0x004e(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x004e
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

	method block_0_0x004f(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x004f
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
		st := Push2(st,0x0041);
		// |fp=0x0080|0x41,_|
		st := Push2(st,0x005e);
		// |fp=0x0080|0x5e,0x41,_|
		st := CallDataSize(st);
		// |fp=0x0080|_,0x5e,0x41,_|
		st := Push1(st,0x04);
		// |fp=0x0080|0x04,_,0x5e,0x41,_|
		st := Push2(st,0x0101);
		// |fp=0x0080|0x101,0x04,_,0x5e,0x41,_|
		assume st.IsJumpDest(0x101);
		st := Jump(st);
		st := block_0_0x0101(st);
		return st;
	}

	method block_0_0x005e(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x005e
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(1) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|_,0x41,_|
		st := Push2(st,0x00da);
		// |fp=0x0080|0xda,_,0x41,_|
		assume st.IsJumpDest(0xda);
		st := Jump(st);
		st := block_0_0x00da(st);
		return st;
	}

	method block_0_0x00da(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00da
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(1) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|_,0x41,_|
		st := PushN(st,8,0x0de0b6b3a7640000);
		// |fp=0x0080|0xde0b6b3a7640000,_,0x41,_|
		st := Dup(st,2);
		// |fp=0x0080|_,0xde0b6b3a7640000,_,0x41,_|
		st := Gt(st);
		// |fp=0x0080|_,_,0x41,_|
		st := IsZero(st);
		// |fp=0x0080|_,_,0x41,_|
		st := Push2(st,0x00ef);
		// |fp=0x0080|0xef,_,_,0x41,_|
		assume st.IsJumpDest(0xef);
		st := JumpI(st);
		if st.PC() == 0xef { st := block_0_0x00ef(st); return st;}
		// |fp=0x0080|_,0x41,_|
		st := Push1(st,0x00);
		st := block_0_0x00ed(st);
		return st;
	}

	method block_0_0x00ed(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00ed
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 4
	// Static stack items
	requires (st'.Peek(0) == 0x0 && st'.Peek(2) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x00,_,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|0x00,0x00,_,0x41,_|
		st := Revert(st);
		return st;
	}

	method block_0_0x00ef(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00ef
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(1) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|_,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_,0x41,_|
		st := SLoad(st);
		// |fp=0x0080|_,_,0x41,_|
		st := IsZero(st);
		// |fp=0x0080|_,_,0x41,_|
		st := Push2(st,0x00fc);
		// |fp=0x0080|0xfc,_,_,0x41,_|
		assume st.IsJumpDest(0xfc);
		st := JumpI(st);
		if st.PC() == 0xfc { st := block_0_0x00fc(st); return st;}
		// |fp=0x0080|_,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_,0x41,_|
		st := Dup(st,1);
		st := block_0_0x00fb(st);
		return st;
	}

	method block_0_0x00fb(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00fb
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 5
	// Static stack items
	requires (st'.Peek(0) == 0x0 && st'.Peek(1) == 0x0 && st'.Peek(3) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x00,0x00,_,0x41,_|
		st := Revert(st);
		return st;
	}

	method block_0_0x00fc(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00fc
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(1) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|_,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_,0x41,_|
		st := SStore(st);
		// |fp=0x0080|0x41,_|
		assume st.IsJumpDest(0x41);
		st := Jump(st);
		st := block_0_0x0041(st);
		return st;
	}

	method block_0_0x0101(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0101
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 5
	// Static stack items
	requires (st'.Peek(0) == 0x4 && st'.Peek(2) == 0x5e && st'.Peek(3) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x04,_,0x5e,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|0x04,_,0x5e,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x04,_,0x5e,0x41,_|
		st := Push1(st,0x20);
		// |fp=0x0080|0x20,0x00,0x04,_,0x5e,0x41,_|
		st := Dup(st,3);
		// |fp=0x0080|0x04,0x20,0x00,0x04,_,0x5e,0x41,_|
		st := Dup(st,5);
		// |fp=0x0080|_,0x04,0x20,0x00,0x04,_,0x5e,0x41,_|
		st := Sub(st);
		// |fp=0x0080|_,0x20,0x00,0x04,_,0x5e,0x41,_|
		st := SLt(st);
		// |fp=0x0080|_,0x00,0x04,_,0x5e,0x41,_|
		st := IsZero(st);
		st := block_0_0x010b(st);
		return st;
	}

	method block_0_0x010b(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x010b
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 7
	// Static stack items
	requires (st'.Peek(1) == 0x0 && st'.Peek(2) == 0x4 && st'.Peek(4) == 0x5e && st'.Peek(5) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x00,0x04,_,0x5e,0x41,_|
		st := Push2(st,0x0113);
		// |fp=0x0080|0x113,_,0x00,0x04,_,0x5e,0x41,_|
		assume st.IsJumpDest(0x113);
		st := JumpI(st);
		if st.PC() == 0x113 { st := block_0_0x0113(st); return st;}
		// |fp=0x0080|0x00,0x04,_,0x5e,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x00,0x04,_,0x5e,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|0x00,0x00,0x00,0x04,_,0x5e,0x41,_|
		st := Revert(st);
		return st;
	}

	method block_0_0x0113(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0113
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 6
	// Static stack items
	requires (st'.Peek(0) == 0x0 && st'.Peek(1) == 0x4 && st'.Peek(3) == 0x5e && st'.Peek(4) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x00,0x04,_,0x5e,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|0x00,0x04,_,0x5e,0x41,_|
		st := Pop(st);
		// |fp=0x0080|0x04,_,0x5e,0x41,_|
		st := CallDataLoad(st);
		// |fp=0x0080|_,_,0x5e,0x41,_|
		st := Swap(st,2);
		// |fp=0x0080|0x5e,_,_,0x41,_|
		st := Swap(st,1);
		// |fp=0x0080|_,0x5e,_,0x41,_|
		st := Pop(st);
		// |fp=0x0080|0x5e,_,0x41,_|
		assume st.IsJumpDest(0x5e);
		st := Jump(st);
		st := block_0_0x005e(st);
		return st;
	}

}
