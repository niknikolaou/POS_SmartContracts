/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import type {
  BaseContract,
  BigNumber,
  BytesLike,
  CallOverrides,
  ContractTransaction,
  Overrides,
  PopulatedTransaction,
  Signer,
  utils,
} from "ethers";
import type {
  FunctionFragment,
  Result,
  EventFragment,
} from "@ethersproject/abi";
import type { Listener, Provider } from "@ethersproject/providers";
import type {
  TypedEventFilter,
  TypedEvent,
  TypedListener,
  OnEvent,
  PromiseOrValue,
} from "../../../common";

export interface OperatorFiltererUpgradeableInterface extends utils.Interface {
  functions: {
    "operatorRestriction()": FunctionFragment;
    "setOperatorRestriction(bool)": FunctionFragment;
  };

  getFunction(
    nameOrSignatureOrTopic: "operatorRestriction" | "setOperatorRestriction"
  ): FunctionFragment;

  encodeFunctionData(
    functionFragment: "operatorRestriction",
    values?: undefined
  ): string;
  encodeFunctionData(
    functionFragment: "setOperatorRestriction",
    values: [PromiseOrValue<boolean>]
  ): string;

  decodeFunctionResult(
    functionFragment: "operatorRestriction",
    data: BytesLike
  ): Result;
  decodeFunctionResult(
    functionFragment: "setOperatorRestriction",
    data: BytesLike
  ): Result;

  events: {
    "OperatorRestriction(bool)": EventFragment;
  };

  getEvent(nameOrSignatureOrTopic: "OperatorRestriction"): EventFragment;
}

export interface OperatorRestrictionEventObject {
  restriction: boolean;
}
export type OperatorRestrictionEvent = TypedEvent<
  [boolean],
  OperatorRestrictionEventObject
>;

export type OperatorRestrictionEventFilter =
  TypedEventFilter<OperatorRestrictionEvent>;

export interface OperatorFiltererUpgradeable extends BaseContract {
  connect(signerOrProvider: Signer | Provider | string): this;
  attach(addressOrName: string): this;
  deployed(): Promise<this>;

  interface: OperatorFiltererUpgradeableInterface;

  queryFilter<TEvent extends TypedEvent>(
    event: TypedEventFilter<TEvent>,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TEvent>>;

  listeners<TEvent extends TypedEvent>(
    eventFilter?: TypedEventFilter<TEvent>
  ): Array<TypedListener<TEvent>>;
  listeners(eventName?: string): Array<Listener>;
  removeAllListeners<TEvent extends TypedEvent>(
    eventFilter: TypedEventFilter<TEvent>
  ): this;
  removeAllListeners(eventName?: string): this;
  off: OnEvent<this>;
  on: OnEvent<this>;
  once: OnEvent<this>;
  removeListener: OnEvent<this>;

  functions: {
    operatorRestriction(overrides?: CallOverrides): Promise<[boolean]>;

    setOperatorRestriction(
      _restriction: PromiseOrValue<boolean>,
      overrides?: Overrides & { from?: PromiseOrValue<string> }
    ): Promise<ContractTransaction>;
  };

  operatorRestriction(overrides?: CallOverrides): Promise<boolean>;

  setOperatorRestriction(
    _restriction: PromiseOrValue<boolean>,
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): Promise<ContractTransaction>;

  callStatic: {
    operatorRestriction(overrides?: CallOverrides): Promise<boolean>;

    setOperatorRestriction(
      _restriction: PromiseOrValue<boolean>,
      overrides?: CallOverrides
    ): Promise<void>;
  };

  filters: {
    "OperatorRestriction(bool)"(
      restriction?: null
    ): OperatorRestrictionEventFilter;
    OperatorRestriction(restriction?: null): OperatorRestrictionEventFilter;
  };

  estimateGas: {
    operatorRestriction(overrides?: CallOverrides): Promise<BigNumber>;

    setOperatorRestriction(
      _restriction: PromiseOrValue<boolean>,
      overrides?: Overrides & { from?: PromiseOrValue<string> }
    ): Promise<BigNumber>;
  };

  populateTransaction: {
    operatorRestriction(
      overrides?: CallOverrides
    ): Promise<PopulatedTransaction>;

    setOperatorRestriction(
      _restriction: PromiseOrValue<boolean>,
      overrides?: Overrides & { from?: PromiseOrValue<string> }
    ): Promise<PopulatedTransaction>;
  };
}
