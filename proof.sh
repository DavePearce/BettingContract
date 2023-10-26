#!/bin/sh

BLOCKSIZE=8

devmpg -o proof --devmdir="../../evm-dafny" --blocksize=$BLOCKSIZE --split proof.json bin/Betting.bin-runtime
