include "../../evm-dafny/src/dafny/evm.dfy"
include "../../evm-dafny/src/dafny/core/code.dfy"
include "Betting_0_header.dfy"
include "Betting_0_util.dfy"

module bet {
	import opened Opcode
	import opened Code
	import opened Memory
	import opened Bytecode
	import opened Header
	import opened util

	method block_0_0x0039(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0039
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 1
	{
		var st := st';
		// |fp=0x0080|_|
		st := JumpDest(st);
		// |fp=0x0080|_|
		st := Push2(st,0x0041);
		// |fp=0x0080|0x41,_|
		st := Push2(st,0x008b);
		// |fp=0x0080|0x8b,0x41,_|
		assume st.IsJumpDest(0x8b);
		st := Jump(st);
		st := block_0_0x008b(st);
		return st;
	}

	method block_0_0x008b(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x008b
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 2
	// Static stack items
	requires (st'.Peek(0) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x41,_|
		st := SLoad(st);
		// |fp=0x0080|_,0x41,_|
		st := CallValue(st);
		// |fp=0x0080|_,_,0x41,_|
		st := Gt(st);
		// |fp=0x0080|_,0x41,_|
		st := IsZero(st);
		// |fp=0x0080|_,0x41,_|
		st := Push2(st,0x009a);
		// |fp=0x0080|0x9a,_,0x41,_|
		assume st.IsJumpDest(0x9a);
		st := JumpI(st);
		if st.PC() == 0x9a { st := block_0_0x009a(st); return st;}
		st := block_0_0x0096(st);
		return st;
	}

	method block_0_0x0096(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x0096
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 2
	// Static stack items
	requires (st'.Peek(0) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|0x00,0x00,0x41,_|
		st := Revert(st);
		return st;
	}

	method block_0_0x009a(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x009a
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 2
	// Static stack items
	requires (st'.Peek(0) == 0x41)
	//
	requires st'.Load(0) >= st'.evm.context.callValue // ADDED BY DJP
	{
		var st := st';
		// |fp=0x0080|0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|0x00,0x00,0x41,_|
		st := SLoad(st);
		// |fp=0x0080|tgt,0x00,0x41,_|
		st := CallValue(st);
		// |fp=0x0080|cv,tgt,0x00,0x41,_|
		st := Swap(st,1);
		// |fp=0x0080|tgt,cv,0x00,0x41,_|
		assert st.Peek(1) <= st.Peek(0); // UNDERFLOW CHECK
		st := Sub(st);
		// |fp=0x0080|x,0x00,0x41,_|
		st := Dup(st,1);
		st := block_0_0x00a3(st);
		return st;
	}

	method block_0_0x00a3(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00a3
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 5
	// Static stack items
	requires (st'.Peek(2) == 0x0 && st'.Peek(3) == 0x41)
	{
		var st := st';
		// |fp=0x0080|x,x,0x00,0x41,_|
		st := Dup(st,3);
		// |fp=0x0080|0x00,x,x,0x00,0x41,_|
		st := SStore(st);
		// |fp=0x0080|x,0x00,0x41,_|
		st := Swap(st,1);
		// |fp=0x0080|0x00,x,0x41,_|
		// assert st.Peek(1) <= st.Peek(0); // REMOVED BY DJP
		st := Sub(st);
		// |fp=0x0080|_,0x41,_|
		st := Push2(st,0x00d8);
		// |fp=0x0080|0xd8,_,0x41,_|
		assume st.IsJumpDest(0xd8);
		st := JumpI(st);
		if st.PC() == 0xd8 { st := block_0_0x00d8(st); return st;}
		// |fp=0x0080|0x41,_|
		st := Push1(st,0x40);
		// |fp=0x0080|0x40,0x41,_|
		st := MLoad(st);
		st := block_0_0x00ae(st);
		return st;
	}

	method block_0_0x00ae(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00ae
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(0) == 0x80 && st'.Peek(1) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x80,0x41,_|
		st := Caller(st);
		// |fp=0x0080|_,0x80,0x41,_|
		st := Swap(st,1);
		// |fp=0x0080|0x80,_,0x41,_|
		st := SelfBalance(st);
		// |fp=0x0080|_,0x80,_,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|_,_,0x80,_,0x41,_|
		st := IsZero(st);
		// |fp=0x0080|_,_,0x80,_,0x41,_|
		st := Push2(st,0x08fc);
		// |fp=0x0080|0x8fc,_,_,0x80,_,0x41,_|
		assert (st.Peek(0) * st.Peek(1)) <= (MAX_U256 as u256);
		st := Mul(st);
		// |fp=0x0080|_,_,0x80,_,0x41,_|
		st := Swap(st,2);
		st := block_0_0x00b8(st);
		return st;
	}

	method block_0_0x00b8(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00b8
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 6
	// Static stack items
	requires (st'.Peek(0) == 0x80 && st'.Peek(4) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x80,_,_,_,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,0x80,_,_,_,0x41,_|
		st := Dup(st,2);
		// |fp=0x0080|0x80,0x00,0x80,_,_,_,0x41,_|
		st := Dup(st,2);
		// |fp=0x0080|0x00,0x80,0x00,0x80,_,_,_,0x41,_|
		st := Dup(st,2);
		// |fp=0x0080|0x80,0x00,0x80,0x00,0x80,_,_,_,0x41,_|
		st := Dup(st,6);
		// |fp=0x0080|_,0x80,0x00,0x80,0x00,0x80,_,_,_,0x41,_|
		st := Dup(st,9);
		// |fp=0x0080|_,_,0x80,0x00,0x80,0x00,0x80,_,_,_,0x41,_|
		st := Dup(st,9);
		// |fp=0x0080|_,_,_,0x80,0x00,0x80,0x00,0x80,_,_,_,0x41,_|
		var CONTINUING(cc) := Call(st);
		{
			var inner := cc.CallEnter(1);
			if inner.EXECUTING? { inner := external_call(cc.sender,inner); }
			st := cc.CallReturn(inner);
        	assert st.Peek(5) == 0x41; // ADDED BY DJP
		}
		st := block_0_0x00c1(st);
		return st;
	}

	method block_0_0x00c1(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00c1
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 7
	// Static stack items
	requires (st'.Peek(1) == 0x80 && st'.Peek(5) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x80,_,_,_,0x41,_|
		st := Swap(st,4);
		// |fp=0x0080|_,0x80,_,_,_,0x41,_|
		st := Pop(st);
		// |fp=0x0080|0x80,_,_,_,0x41,_|
		st := Pop(st);
		// |fp=0x0080|_,_,_,0x41,_|
		st := Pop(st);
		// |fp=0x0080|_,_,0x41,_|
		st := Pop(st);
		// |fp=0x0080|_,0x41,_|
		st := IsZero(st);
		// |fp=0x0080|_,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|_,_,0x41,_|
		st := IsZero(st);
		st := block_0_0x00c9(st);
		return st;
	}

	method block_0_0x00c9(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00c9
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 4
	// Static stack items
	requires (st'.Peek(2) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,_,0x41,_|
		st := Push2(st,0x00d6);
		// |fp=0x0080|0xd6,_,_,0x41,_|
		assume st.IsJumpDest(0xd6);
		st := JumpI(st);
		if st.PC() == 0xd6 { st := block_0_0x00d6(st); return st;}
		// |fp=0x0080|_,0x41,_|
		st := ReturnDataSize(st);
		// |fp=0x0080|_,_,0x41,_|
		st := Push1(st,0x00);
		// |fp=0x0080|0x00,_,_,0x41,_|
		st := Dup(st,1);
		// |fp=0x0080|0x00,0x00,_,_,0x41,_|
		st := ReturnDataCopy(st);
		// |fp=0x0080|_,0x41,_|
		st := ReturnDataSize(st);
		// |fp=0x0080|_,_,0x41,_|
		st := Push1(st,0x00);
		st := block_0_0x00d5(st);
		return st;
	}

	method block_0_0x00d5(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00d5
	// Free memory pointer
	requires st'.MemSize() >= 0x60 // && st'.Read(0x40) == 0x80 // REMOVED BY DJP
	// Stack height(s)
	requires st'.Operands() == 5
	// Static stack items
	requires (st'.Peek(0) == 0x0 && st'.Peek(3) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x00,_,_,0x41,_|
		st := Revert(st);
		return st;
	}

	method block_0_0x00d6(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00d6
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 3
	// Static stack items
	requires (st'.Peek(1) == 0x41)
	{
		var st := st';
		// |fp=0x0080|_,0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|_,0x41,_|
		st := Pop(st);
		// |fp=0x0080|0x41,_|
		st := block_0_0x00d8(st);
		return st;
	}

	method block_0_0x00d8(st': EvmState.ExecutingState) returns (st'': EvmState.State)
	requires st'.evm.code == Code.Create(BYTECODE_0)
	requires st'.WritesPermitted() && st'.PC() == 0x00d8
	// Free memory pointer
	requires st'.MemSize() >= 0x60 && st'.Read(0x40) == 0x80
	// Stack height(s)
	requires st'.Operands() == 2
	// Static stack items
	requires (st'.Peek(0) == 0x41)
	{
		var st := st';
		// |fp=0x0080|0x41,_|
		st := JumpDest(st);
		// |fp=0x0080|0x41,_|
		assume st.IsJumpDest(0x41);
		st := Jump(st);
		st := block_0_0x0041(st);
		return st;
	}

}
