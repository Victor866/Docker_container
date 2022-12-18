pragma solidity ^0.5.16;

contract SimpleBank {
    mapping(address => uint256) internal balances;
    address public owner;
    event LogDepositMade(address accountAddress, uint256 amount);

    constructor() public {
        owner = msg.sender;
    }

    function enroll() public returns (uint256) {
        balances[msg.sender] = 1000;
        return balances[msg.sender];
    }

    function deposit() public payable returns (uint256) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    function withdraw(uint256 withdrawAmount)
        public
        returns (uint256 remainingBal)
    {
        require(withdrawAmount <= balances[msg.sender]);

        balances[msg.sender] -= withdrawAmount;
        if (!msg.sender.send(withdrawAmount)) {
            balances[msg.sender] += withdrawAmount;
        }

        remainingBal = balances[msg.sender];
    }

    function balance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function() external {
        revert();
    }
}
