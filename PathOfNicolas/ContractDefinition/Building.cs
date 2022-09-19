using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Solidity POS.Contracts.PathOfNicolas.ContractDefinition
{
    public partial class Building : BuildingBase { }

    public class BuildingBase 
    {
        [Parameter("uint256", "Currentlevel", 1)]
        public virtual BigInteger Currentlevel { get; set; }
        [Parameter("bool", "Pending", 2)]
        public virtual bool Pending { get; set; }
        [Parameter("uint256", "Start", 3)]
        public virtual BigInteger Start { get; set; }
        [Parameter("uint256", "Finish", 4)]
        public virtual BigInteger Finish { get; set; }
    }
}
