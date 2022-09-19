using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Numerics;
using Nethereum.Hex.HexTypes;
using Nethereum.ABI.FunctionEncoding.Attributes;

namespace Solidity POS.Contracts.PathOfNicolas.ContractDefinition
{
    public partial class Player : PlayerBase { }

    public class PlayerBase 
    {
        [Parameter("bool", "register", 1)]
        public virtual bool Register { get; set; }
        [Parameter("tuple[3]", "buildings", 2)]
        public virtual List<Building> Buildings { get; set; }
    }
}
