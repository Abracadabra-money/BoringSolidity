// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import {BoringMath, BoringMath128} from "/libraries/BoringMath.sol";

contract BoringMathTest is Test {
    using BoringMath for uint256;
    using BoringMath128 for uint128;

    function setUp() public {}

    function testRevertOnUint128Overflow() public {
        uint256 a = type(uint128).max;
        uint128 b = a.to128();
        assertEq(a, b);

        a++;
        vm.expectRevert(abi.encodeWithSelector(BoringMath.ErrOverflow.selector));
        b = a.to128();
    }

    function testRevertOnUint64Overflow() public {
        uint256 a = type(uint64).max;
        uint128 b = a.to64();
        assertEq(a, b);

        a++;
        vm.expectRevert(abi.encodeWithSelector(BoringMath.ErrOverflow.selector));
        b = a.to64();
    }

    function testRevertOnUint32Overflow() public {
        uint256 a = type(uint32).max;
        uint128 b = a.to32();
        assertEq(a, b);

        a++;
        vm.expectRevert(abi.encodeWithSelector(BoringMath.ErrOverflow.selector));
        b = a.to32();
    }
}
