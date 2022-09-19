using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.Web3;
using Nethereum.RPC.Eth.DTOs;
using Nethereum.Contracts.CQS;
using Nethereum.Contracts;
using System.Threading;

namespace Solidity POS.Contracts.PathOfNicolas.ContractDefinition
{


    public partial class PathOfNicolasDeployment : PathOfNicolasDeploymentBase
    {
        public PathOfNicolasDeployment() : base(BYTECODE) { }
        public PathOfNicolasDeployment(string byteCode) : base(byteCode) { }
    }

    public class PathOfNicolasDeploymentBase : ContractDeploymentMessage
    {
        public static string BYTECODE = "608060405234801561001057600080fd5b5061070d806100206000396000f3fe608060405234801561001057600080fd5b50600436106100575760003560e01c806323a39aa41461005c5780632c9387f61461006f578063397f1f5f1461008f57806348a86d7e14610099578063c847fac0146100ac575b600080fd5b6040514281526020015b60405180910390f35b61008261007d3660046105af565b6100bf565b60405161006691906105df565b61009761016c565b005b6100976100a7366004610641565b610224565b6100976100ba366004610641565b6103ee565b6100c761053c565b6001600160a01b03821660009081526020818152604080832081518083018352815460ff16151581528251606081019093529290919083019060018301600386835b8282101561015d57604080516080810182526004840286018054825260018082015460ff16151560208085019190915260028301549484019490945260039091015460608301529083529092019101610109565b50505091525090949350505050565b3360009081526020819052604090205460ff16156101c45760405162461bcd60e51b815260206004820152601060248201526f30b63932b0b23c903932b3b4b9ba32b960811b60448201526064015b60405180910390fd5b336000908152602081905260408120805460ff19166001178155905b60038110156102205760008260010182600381106102005761020061065a565b60016004919091029190910155508061021881610686565b9150506101e0565b5050565b3360009081526020819052604090205460ff1661027a5760405162461bcd60e51b81526020600482015260146024820152733cb7ba9030b932903737ba103932b3b4b9ba32b960611b60448201526064016101bb565b3360009081526020819052604090204260018201836003811061029f5761029f61065a565b6004020160030154116102e55760405162461bcd60e51b815260206004820152600e60248201526d5374696c6c205570646174696e6760901b60448201526064016101bb565b8060010182600381106102fa576102fa61065a565b600402016001015460ff166103405760405162461bcd60e51b815260206004820152600c60248201526b155c19185d1948119a5c9cdd60a21b60448201526064016101bb565b60018160010183600381106103575761035761065a565b60040201805460009061036b90849061069f565b90915550600090506001820183600381106103885761038861065a565b600402016002018190555060008160010183600381106103aa576103aa61065a565b600402016003018190555060008160010183600381106103cc576103cc61065a565b6004020160010160006101000a81548160ff0219169083151502179055505050565b3360009081526020819052604090205460ff166104445760405162461bcd60e51b81526020600482015260146024820152733cb7ba9030b932903737ba103932b3b4b9ba32b960611b60448201526064016101bb565b336000908152602081905260409020426001820183600381106104695761046961065a565b6004020160030154106104b55760405162461bcd60e51b8152602060048201526014602482015273557064617465207374696c6c2070656e64696e6760601b60448201526064016101bb565b428160010183600381106104cb576104cb61065a565b60040201600201819055508060010182600381106104eb576104eb61065a565b60040201546104fb90600a6106b8565b610505904261069f565b81600101836003811061051a5761051a61065a565b600402016003018190555060018160010183600381106103cc576103cc61065a565b604051806040016040528060001515815260200161055861055d565b905290565b60405180606001604052806003905b61059960405180608001604052806000815260200160001515815260200160008152602001600081525090565b81526020019060019003908161056c5790505090565b6000602082840312156105c157600080fd5b81356001600160a01b03811681146105d857600080fd5b9392505050565b8151151581526020808301516101a08301919081840160005b600381101561063757825180518352848101511515858401526040808201519084015260609081015190830152918301916080909101906001016105f8565b5050505092915050565b60006020828403121561065357600080fd5b5035919050565b634e487b7160e01b600052603260045260246000fd5b634e487b7160e01b600052601160045260246000fd5b60006001820161069857610698610670565b5060010190565b808201808211156106b2576106b2610670565b92915050565b60008160001904831182151516156106d2576106d2610670565b50029056fea26469706673582212209c10893e060f1190060629d4a62a0fb3f7281b85c3d56935ac519d4e5f2345f864736f6c63430008100033";
        public PathOfNicolasDeploymentBase() : base(BYTECODE) { }
        public PathOfNicolasDeploymentBase(string byteCode) : base(byteCode) { }

    }

    public partial class CompleteUpdateBuildingFunction : CompleteUpdateBuildingFunctionBase { }

    [Function("CompleteUpdateBuilding")]
    public class CompleteUpdateBuildingFunctionBase : FunctionMessage
    {
        [Parameter("uint256", "_id", 1)]
        public virtual BigInteger Id { get; set; }
    }

    public partial class CurrectTimeFunction : CurrectTimeFunctionBase { }

    [Function("CurrectTime", "uint256")]
    public class CurrectTimeFunctionBase : FunctionMessage
    {

    }

    public partial class GetUserInfoFunction : GetUserInfoFunctionBase { }

    [Function("GetUserInfo", typeof(GetUserInfoOutputDTO))]
    public class GetUserInfoFunctionBase : FunctionMessage
    {
        [Parameter("address", "wallet", 1)]
        public virtual string Wallet { get; set; }
    }

    public partial class RegisterInGameFunction : RegisterInGameFunctionBase { }

    [Function("RegisterInGame")]
    public class RegisterInGameFunctionBase : FunctionMessage
    {

    }

    public partial class UpdateBuildingFunction : UpdateBuildingFunctionBase { }

    [Function("UpdateBuilding")]
    public class UpdateBuildingFunctionBase : FunctionMessage
    {
        [Parameter("uint256", "_id", 1)]
        public virtual BigInteger Id { get; set; }
    }



    public partial class CurrectTimeOutputDTO : CurrectTimeOutputDTOBase { }

    [FunctionOutput]
    public class CurrectTimeOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("uint256", "", 1)]
        public virtual BigInteger ReturnValue1 { get; set; }
    }

    public partial class GetUserInfoOutputDTO : GetUserInfoOutputDTOBase { }

    [FunctionOutput]
    public class GetUserInfoOutputDTOBase : IFunctionOutputDTO 
    {
        [Parameter("tuple", "", 1)]
        public virtual Player ReturnValue1 { get; set; }
    }




}
