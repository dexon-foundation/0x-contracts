/*

  Copyright 2019 DEXON Foundation.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/
pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

import "@0x/contracts-exchange-libs/contracts/src/LibOrder.sol";
import "@0x/contracts-exchange-libs/contracts/src/LibFillResults.sol";


contract IOrderbook {

    /// @dev Place a limit order into orderbook.
    /// @param order Order struct containing order specifications.
    /// @return Amounts filled and fees paid by maker and taker.
    function placeLimitOrder(
        LibOrder.Order memory order
    )
        public
        returns (LibFillResults.FillResults memory fillResults);

    /// @dev Fill orders in orderbook that match desired specifications.
    ///      But unlike 'placeLimitOrder', remaining amount will not be put into orderbook.
    /// @param order Order struct containing order specifications.
    /// @return Amounts filled and fees paid by maker and taker.
    function placeMarketOrder(
        LibOrder.Order memory order
    )
        public
        returns (LibFillResults.FillResults memory fillResults);

    /// @dev Get a list of valid orders on orderbook of a specific pair.
    /// @param makerAssetData Maker asset data of the pair.
    /// @param takerAssetData Taker asset data of the pair.
    /// @param limit Maximum number of orders to be returned.
    /// @return Orders of the pair, sorted by price.
    function getOrders(
        bytes makerAssetData,
        bytes takerAssetData,
        uint8 limit
    )
        public
        view
        returns (LibOrder.Order[] memory orders);
}
