// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {LiquidityCalculator} from "../src/LiquidityCalculator.sol";

contract LiquidityCalculatorTest is Test {
    LiquidityCalculator public liquidityCalculator;
    
    event DebugLogUInt128(uint128 value);

    function setUp() public {
        liquidityCalculator = new LiquidityCalculator();
    }

    function test_LiquidityForScenario1() public {
        uint128 liquidity = liquidityCalculator.getLiquidityForScenario1();
        emit DebugLogUInt128(liquidity); // Log the value using an event
        assertEq(liquidity, 1.3e21);
    }
}
