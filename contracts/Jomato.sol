// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Jomato {
  uint256 private _totalSupply=1000000000000000000000000;
  string private _name="Jomato";
  string private _symbol="JMT";
  uint8 private _decimals=18;
  string private _website = "";

  mapping(address => uint) private _balances;
  mapping(address => mapping(address => uint)) private _allowance;

  event Transfer(
      address indexed _from,
      address indexed _to,
      uint _value

  );

  event Approval(
      address indexed _owner,
      address indexed _spender,
      uint _value
  );

  constructor() {
    _balances[msg.sender]=_totalSupply;
  }

   
    // Returns the name of the token.
    function name() public view returns (string memory) {
        return _name;
    }
 
    // Returns the symbol of the token.
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    // Returns the number of decimals of the token.
    function decimals() public view returns (uint8) {
        return _decimals;
    }
 
    // Returns the total number of tokens in existence.
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function website() public view returns (string memory){
      return _website;
    }

    // Returns the amount of tokens that `account` has.
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address _to,uint _value) public returns(bool success){
        require(_balances[msg.sender]>=_value);
        _balances[msg.sender] -= _value;
        _balances[_to]+=_value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }


    function transferFrom(address _from,address _to,uint _value)public returns(bool success){
        require(_value <= _balances[_from]);
        require(_value <= _allowance[_from][msg.sender]);
        _balances[_to] += _value;
        _balances[_from] += _value;
        _allowance[msg.sender][_from] -= _value;
        emit Transfer(_from,_to,_value);
        return true;
    }

    function approve(address _spender,uint _value)public returns(bool success){
        _allowance[msg.sender][_spender]=_value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
      return _allowance[_owner][_spender];
    }

}
