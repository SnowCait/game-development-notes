// 1つのクラスで管理する
class Item
{
  public int Id;
  public string Name;
  public int Amount;
  public int MinAmount;
  public int MaxAmount;
  public DateTime Enabled;
  public DateTime Expired; // 2020-01-01 00:00:00 or +1 week
  
  public Item(int id)
  {
    this.Id = id;
    var master = new ItemMaster(id); // load from csv, json, etc
    this.MinAmount = master.Min;
    this.MaxAmount = master.Max;
    if (master.Enabled < DateTime.Now)
    {
      throw new Exception();
    }
    
    //
  }
}

// UserItem と ItemMaster でクラスを分けて管理する
class UserItem
{
  public int Id;
  public int Amount;
  public DateTime Expired;
  public ItemMaster Master;
}

class ItemMaster
{
  public string Name;
  public int Min;
  public int Max;
  public DateTime Enabled;
  public DateTime Expired;
}
