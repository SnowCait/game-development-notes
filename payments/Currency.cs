// 通貨インターフェース
interface ICurrency
{
  public double Value { get; set; }
}

// 仮想通貨インターフェース
interface ICryptocurrency : ICurrency {}

// 硬貨インターフェース（紙幣と同列、プログラムには不要な気がする）
interface ICoin : ICurrency
{
  public double Unit { get; } 
}

// 紙幣インターフェース
interface IBill : ICurrency
{
  public double Unit { get; }
}


// 日本円(JPY)
class Jpy : ICurrency {}

// アメリカドル(USD)
class Usd : ICurrency {}

// ビットコイン(BTC)
class Bitcoin : ICryptocurrency {}

// Ethereum(ETH)
class Ethereum : ICryptocurrency {}
