// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Token.sol";

contract DelegateAccount {
    address private TokenContractAddress;
    IERC20 private _tokenAddress;
    uint256 private _transferLimit;

    constructor(address tokenAddress, uint256 transferLimit) {
        TokenContractAddress = tokenAddress;
        _tokenAddress = IERC20(tokenAddress);
        _transferLimit = transferLimit;
    }

    function transferFrom(address receipient) public {
        _tokenAddress.approve(address(this), _transferLimit);
        _tokenAddress.transferFrom(TokenContractAddress, receipient, _transferLimit);
    }

    function getTransferLimit() public view returns (uint256) {
        return _transferLimit;
    }
}
