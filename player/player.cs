class Player
{
    public int Id { get; set; }
    public Role Role { get; set; }
    public State State { get; set; }
}

enum Role
{
    General,
    Admin,
}

enum State
{
    Tutorial,
    Active,
    Deleted,
}
