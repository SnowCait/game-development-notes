<?php
// select に渡す interface を定義したかったが微妙…

interface RecordInterface;

// テーブル毎の interface だとカラムを絞るのに不便そう
interface UserRecordInterface implements RecordInterface;

class ActiveRecord
{
    public function select(RecordInterface $columns);
}

class UserRecord implements UserRecordInterface;
class User
{
    public function get(int id): UserRecord
    {
        $record = new UserRecord();
        return $this->db->select($record)->get();
    }
}

// こんな感じの方がいいかも
Select<T>();
