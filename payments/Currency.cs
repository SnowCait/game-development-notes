// 通貨インターフェース
interface ICurrency
{
  double Value { get; set; }
}

// 仮想通貨インターフェース
interface ICryptocurrency : ICurrency {}


// 日本円(JPY)
class Jpy : ICurrency {}

// アメリカドル(USD)
class Usd : ICurrency {}

// ビットコイン(BTC)
class Bitcoin : ICryptocurrency {}

// Ethereum(ETH)
class Ethereum : ICryptocurrency {}
