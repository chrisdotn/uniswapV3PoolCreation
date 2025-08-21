// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import "./UniswapV3FactoryListener.sol";

contract Triggers is BaseTriggers {

    address constant UNISWAPV3_FACTORY_ETHEREUM = 0x1F98431c8aD98523631AE4a59f267346ea31F984;
    address constant UNISWAPV3_FACTORY_UNICHAIN = 0x1F98400000000000000000000000000000000003;
    address constant UNISWAPV3_FACTORY_BASE = 0x33128a8fC17869897dcE68Ed026d694621f6FDfD;

    function triggers() external virtual override {
        UniswapV3FactoryListener listener = new UniswapV3FactoryListener();
        addTrigger(
            chainContract(Chains.Ethereum, UNISWAPV3_FACTORY_ETHEREUM),
            listener.triggerOnCreatePoolFunction()
        );
        addTrigger(
            chainContract(Chains.Unichain, UNISWAPV3_FACTORY_UNICHAIN),
            listener.triggerOnCreatePoolFunction()
        );
        addTrigger(
            chainContract(Chains.Base, UNISWAPV3_FACTORY_BASE),
            listener.triggerOnCreatePoolFunction()
        );
        addTrigger(
            chainContract(Chains.Ethereum, UNISWAPV3_FACTORY_ETHEREUM),
            listener.triggerOnOwnerChangedEvent()
        );
    }
}
