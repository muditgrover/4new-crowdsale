/**
 * This smart contract is modified 2017 by 4new.co.uk to assemble code for creation of FRNCoin with
 * it's unique characteristics. 
 *
 * Licensed under the Apache License, version 2.0
 */

/**
 * This smart contract code is Copyright 2017 TokenMarket Ltd. For more information see https://tokenmarket.net
 *
 * Licensed under the Apache License, version 2.0: https://github.com/TokenMarketNet/ico/blob/master/LICENSE.txt
 */

pragma solidity ^0.4.8;

import './BurnableToken.sol';
import "./ReleasableToken.sol";


/**
 * FRNCoin
 *
 * Capped, burnable, and transfer releaseable ERC20 token 
 * for 4new.co.uk
 *
 */
contract FRNCoin is ReleasableToken, BurnableToken {

  /** Name and symbol were updated. */
  event UpdatedTokenInformation(string newName, string newSymbol);

  string public name;

  string public symbol;

  uint public decimals;

  /**
   * Construct the token.
   *
   * @param _name Token name
   * @param _symbol Token symbol
   * @param _initialSupply How many tokens we start with
   * @param _decimals Number of decimal places
   */
  function FRNCoin(string _name, string _symbol, uint _initialSupply, uint _decimals) {
    // Cannot create a token without supply
    require(_initialSupply != 0);

    owner = msg.sender;

    name = _name;
    symbol = _symbol;

    totalSupply = _initialSupply;

    decimals = _decimals;

    // Create initially all balance on owner
    balances[owner] = totalSupply;
  }

  /**
   * To update token information at the end.
   *
   */
  function setTokenInformation(string _name, string _symbol) onlyOwner {
    name = _name;
    symbol = _symbol;

    UpdatedTokenInformation(name, symbol);
  }
}

