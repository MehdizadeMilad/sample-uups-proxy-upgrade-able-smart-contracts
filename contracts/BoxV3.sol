// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.9;

import "./BoxV2.sol";
import "./StorageV2.sol";
import "./interfaces/IBoxV3.sol";

contract BoxV3 is BoxV2, StorageV2, IBoxV3 {
    function readDepositedAmount() external view returns (uint256) {
        return depositedTokens[_msgSender()];
    }

    function deposit(uint256 _amount)
        external
        whenNotPaused
        returns (bool success)
    {
        require(_amount > 0, "_amount > 0");
        depositedTokens[_msgSender()] += _amount;
        success = true;

        emit Deposited(_msgSender(), _amount);
    }
}
