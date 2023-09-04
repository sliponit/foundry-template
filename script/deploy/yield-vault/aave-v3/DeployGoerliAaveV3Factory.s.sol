// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import { AaveV3OptimismGoerli } from "aave-address-book/AaveV3OptimismGoerli.sol";
import { AaveV3ERC4626Factory, IPool, IRewardsController } from "yield-daddy/aave-v3/AaveV3ERC4626Factory.sol";

import { ScriptHelpers } from "../../../helpers/ScriptHelpers.sol";

contract DeployAaveV3Factory is ScriptHelpers {
  function run() public {
    vm.startBroadcast();

    if (block.chainid == OPTIMISM_GOERLI_CHAIN_ID) {
      new AaveV3ERC4626Factory(
        IPool(address(AaveV3OptimismGoerli.POOL)),
        EXECUTIVE_TEAM_OPTIMISM_ADDRESS, // Reward recipient, TODO??
        IRewardsController(address(AaveV3OptimismGoerli.DEFAULT_INCENTIVES_CONTROLLER))
      );
    }

    vm.stopBroadcast();
  }
}
