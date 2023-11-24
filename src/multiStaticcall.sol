// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract MultiStaticcall {
    struct Staticcall {
        address target;
        bytes callData;
    }

    struct ReturnDatum {
        bytes returnDatum;
        bool success;
    }

    function multiStaticcall(Staticcall[] calldata staticcalls)
        external
        view
        returns (ReturnDatum[] memory returnData)
    {
        returnData = new ReturnDatum[](staticcalls.length);

        for (uint256 i; i < staticcalls.length; ++i) {
            ReturnDatum memory returnDatum;
            Staticcall memory staticcall = staticcalls[i];
            (returnDatum.success, returnDatum.returnDatum) = staticcall.target.staticcall(staticcall.callData);

            returnData[i] = returnDatum;
        }
    }
}
