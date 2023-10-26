include "../../evm-dafny/src/dafny/evm.dfy"
include "../../evm-dafny/src/dafny/core/code.dfy"
include "Betting_0_header.dfy"
include "Betting_0_reset.dfy"
include "Betting_0_bet.dfy"
include "Betting_0_target.dfy"

module main {
	import opened Opcode
	import opened Code
	import opened Memory
	import opened Bytecode
	import opened Header
	import opened reset
	import opened bet
	import opened target

	method block_0_0x0000(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0000
	// Stack height(s)
	requires st'.Operands() == 0
	{
		var st := st';
		// |fp=0x0000||
		st := Push1(st,0x80);
		// |fp=0x0000|0x80|
		st := Push1(st,0x40);
		// |fp=0x0000|0x40,0x80|
		st := MStore(st);
		// |fp=0x0080||
		st := Push1(st,0x04);
		// |fp=0x0080|0x04|
		st := CallDataSize(st);
		// |fp=0x0080|_,0x04|
		st := Lt(st);
		// |fp=0x0080|_|
		st := Push2(st,0x0034);
		// |fp=0x0080|0x34,_|
		assume st.IsJumpDest(0x34);
		st := JumpI(st);
		if st.PC() == 0x34 { st := block_0_0x0034(st); return st;}
		st := block_0_0x000d(st);
		return st;
	}

	method block_0_0x000d(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x000d
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 0
	{
		var st := st';
		// |fp=0x0080||
		st := Push1(st,0x00);
		// |fp=0x0080|0x00|
		st := CallDataLoad(st);
		// |fp=0x0080|_|
		st := Push1(st,0xe0);
		// |fp=0x0080|0xe0,_|
		st := Shr(st);
		// |fp=0x0080|_|
		st := Dup(st,1);
		// |fp=0x0080|_,_|
		st := Push4(st,0x11610c25);
		// |fp=0x0080|0x11610c25,_,_|
		st := Eq(st);
		// |fp=0x0080|_,_|
		st := Push2(st,0x0039);
		st := block_0_0x001d(st);
		return st;
	}

	method block_0_0x001d(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x001d
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(0) == 0x39)
	{
		var st := st';
		// |fp=0x0080|0x39,_,_|
		assume st.IsJumpDest(0x39);
		st := JumpI(st);
		if st.PC() == 0x39 { st := block_0_0x0039(st); return st;}
		// |fp=0x0080|_|
		st := Dup(st,1);
		// |fp=0x0080|_,_|
		st := Push4(st,0x310bd74b);
		// |fp=0x0080|0x310bd74b,_,_|
		st := Eq(st);
		// |fp=0x0080|_,_|
		st := Push2(st,0x0043);
		// |fp=0x0080|0x43,_,_|
		assume st.IsJumpDest(0x43);
		st := JumpI(st);
		if st.PC() == 0x43 { st := block_0_0x0043(st); return st;}
		// |fp=0x0080|_|
		st := Dup(st,1);
		// |fp=0x0080|_,_|
		st := Push4(st,0xd4b83992);
		st := block_0_0x002f(st);
		return st;
	}

	method block_0_0x002f(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x002f
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(0) == 0xd4b83992)
	{
		var st := st';
		// |fp=0x0080|0xd4b83992,_,_|
		st := Eq(st);
		// |fp=0x0080|_,_|
		st := Push2(st,0x0063);
		// |fp=0x0080|0x63,_,_|
		assume st.IsJumpDest(0x63);
		st := JumpI(st);
		if st.PC() == 0x63 { st := block_0_0x0063(st); return st;}
		// |fp=0x0080|_|
		// |fp=0x0080||
		st := block_0_0x0034(st);
		return st;
	}

	method block_0_0x0034(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0034
	// Free memory pointer
	requires Memory.Size(st'.evm.memory) >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() >= 0 && st'.Operands() <= 1
	{
		var st := st';
		// |fp=0x0080|_|
		// |fp=0x0080||
		st := JumpDest(st);
		// |fp=0x0080|_|
		// |fp=0x0080||
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_|
		// |fp=0x0080|0x00|
		st := Dup(st,1);
		// |fp=0x0080|0x00,0x00,_|
		// |fp=0x0080|0x00,0x00|
		st := Revert(st);
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

}
