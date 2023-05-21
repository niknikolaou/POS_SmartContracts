// SPDX-License-Identifier: MIT
// @author: thirdweb (https://github.com/thirdweb-dev/dynamic-contracts)

pragma solidity ^0.8.0;

import "../BaseRouter.sol";

/**
 *  This smart contract is an EXAMPLE, and is not meant for use in production.
 */

contract RouterImmutable is BaseRouter {
    
    constructor(Extension[] memory _extensions) BaseRouter(_extensions) {}

    /*///////////////////////////////////////////////////////////////
                            Overrides
    //////////////////////////////////////////////////////////////*/

    /// @dev Returns whether extensions can be set in the given execution context.
    function _canSetExtension() internal pure override returns (bool) {
        return false;
    }
}
