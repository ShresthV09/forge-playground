// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {LiquidityCalculatorByMulDiv} from "../src/LiquidityCalbyMuldiv.sol";

contract LiquidityCalculatorByMulDivTest is Test {
    LiquidityCalculatorByMulDiv public calculator;

    // function assertEq(
    //     uint128 a,
    //     uint128 b,
    //     uint128 tolerance
    // ) internal virtual {
    //     require(
    //         a >= b - tolerance && a <= b + tolerance,
    //         "Values are not equal within tolerance"
    //     );
    // }

    event DebugLogUInt128(uint128 value);

    function setUp() public {
        calculator = new LiquidityCalculatorByMulDiv();
    }

    function test_LiquidityForAmount0() public {
        uint160 sqrtPriceAX96 = uint160(2600 * (1 << 96));
        uint160 sqrtPriceBX96 = uint160(2800 * (1 << 96));
        uint256 amount0 = 1 ether; // Assuming WETH has 18 decimals

        uint128 liquidity = calculator.getLiquidityForAmount0(
            sqrtPriceAX96,
            sqrtPriceBX96,
            amount0
        );
        emit DebugLogUInt128(liquidity);

        // Replace the value on the right with your expected result
        // uint128 tolerance = 10; // Define an acceptable tolerance range

        // assertEq(liquidity, 936668874720992700000);
    }

    function test_LiquidityForAmount1() public {
        uint160 sqrtPriceAX96 = uint160(2600 * (1 << 96));
        uint160 sqrtPriceBX96 = uint160(2800 * (1 << 96));
        uint256 amount1 = 2700 * 1e6; // Assuming USDC has 6 decimals

        uint128 liquidity = calculator.getLiquidityForAmount1(
            sqrtPriceAX96,
            sqrtPriceBX96,
            amount1
        );
        emit DebugLogUInt128(liquidity);
        // uint128 tolerance = 10; // Define an acceptable tolerance range
        // // Replace the value on the right with your expected result
        // assertEq(liquidity, 463276836019690500000);
    }

    function test_LiquidityForAmounts_WithinBounds() public {
        uint160 sqrtPriceX96 = uint160(2650 * (1 << 96)); // Price between A and B
        uint160 sqrtPriceAX96 = uint160(2600 * (1 << 96));
        uint160 sqrtPriceBX96 = uint160(2800 * (1 << 96));
        uint256 amount0 = 1 ether;
        uint256 amount1 = 2700 * 1e6;
        // uint128 tolerance = 10; // Define an acceptable tolerance range
        uint128 liquidity = calculator.getLiquidityForAmounts(
            sqrtPriceX96,
            sqrtPriceAX96,
            sqrtPriceBX96,
            amount0,
            amount1
        );
        emit DebugLogUInt128(liquidity);

        // Replace the value on the right with your expected result
        // assertEq(liquidity, 480852313681350100000);
    }

    function test_LiquidityForAmounts_OutOfBounds() public {
        uint160 sqrtPriceX96 = uint160(2900 * (1 << 96)); // Price above B
        uint160 sqrtPriceAX96 = uint160(2600 * (1 << 96));
        uint160 sqrtPriceBX96 = uint160(2800 * (1 << 96));
        uint256 amount0 = 1 ether;
        uint256 amount1 = 2700 * 1e6;

        uint128 liquidity = calculator.getLiquidityForAmounts(
            sqrtPriceX96,
            sqrtPriceAX96,
            sqrtPriceBX96,
            amount0,
            amount1
        );
        emit DebugLogUInt128(liquidity);
        // uint128 tolerance = 10; // Define an acceptable tolerance range
        // // Replace the value on the right with your expected result
        // assertEq(liquidity, 1364998216455147000000);
    }
}
