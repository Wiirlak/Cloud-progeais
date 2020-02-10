using System.Data;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace AquariumApi
{
    public class Aquarium
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Capacity { get; set; }
        public int Occupation { get; set; }
        public int CurrTemp { get; set; }
        public int PerfectTemp { get; set; }

        internal AppDb Db { get; set; }

        public Aquarium()
        {
        }

        internal Aquarium(AppDb db)
        {
            Db = db;
        }

        public async Task InsertAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"INSERT INTO `aquarium` (`name`, `capacity`, `occupation`, `currTemp`, `perfectTemp`) 
                                                VALUES (@Name, @Capacity, @Occupation, @CurrTemp, @PerfectTemp);";
            BindParams(cmd);
            await cmd.ExecuteNonQueryAsync();
            Id = (int) cmd.LastInsertedId;
        }

        public async Task UpdateAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"UPDATE `aquarium` SET `name` = @Name, `capacity` = @Capacity, `occupation` = @Occupation, `currTemp` = @CurrTemp, `perfectTemp` = @PerfectTemp 
                                                WHERE `id` = @Id;";
            BindParams(cmd);
            BindId(cmd);
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task DeleteAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"DELETE FROM `aquarium` WHERE `id` = @Id;";
            BindId(cmd);
            await cmd.ExecuteNonQueryAsync();
        }

        private void BindId(MySqlCommand cmd)
        {
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Id",
                DbType = DbType.Int32,
                Value = Id,
            });
        }

        private void BindParams(MySqlCommand cmd)
        {
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Name",
                DbType = DbType.String,
                Value = Name,
            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Capacity",
                DbType = DbType.Int32,
                Value = Capacity,
            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Occupation",
                DbType = DbType.Int32,
                Value = Occupation,
            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@CurrTemp",
                DbType = DbType.Int32,
                Value = CurrTemp,
            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@PerfectTemp",
                DbType = DbType.Int32,
                Value = PerfectTemp,
            });
        }
    }
}