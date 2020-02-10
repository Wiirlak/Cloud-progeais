using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace AquariumApi
{
    public class AquariumQuery
    {
        public AppDb Db { get; }

        public AquariumQuery(AppDb db)
        {
            Db = db;
        }

        public async Task<Aquarium> FindOneAsync(int id)
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT * FROM `aquarium` WHERE `id` = @id";
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@id",
                DbType = DbType.Int32,
                Value = id,
            });
            var result = await ReadAllAsync(await cmd.ExecuteReaderAsync());
            return result.Count > 0 ? result[0] : null;
        }

        public async Task<List<Aquarium>> LatestPostsAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT * FROM `aquarium` ORDER BY `id` DESC LIMIT 10;";
            return await ReadAllAsync(await cmd.ExecuteReaderAsync());
        }

        public async Task DeleteAllAsync()
        {
            using var txn = await Db.Connection.BeginTransactionAsync();
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"DELETE FROM `aquarium`";
            await cmd.ExecuteNonQueryAsync();
            await txn.CommitAsync();
        }

        private async Task<List<Aquarium>> ReadAllAsync(DbDataReader reader)
        {
            var posts = new List<Aquarium>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var post = new Aquarium(Db)
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Capacity = reader.GetInt32(2),
                        Occupation = reader.GetInt32(3),
                        CurrTemp = reader.GetInt32(4),
                        PerfectTemp = reader.GetInt32(5),
                    };
                    posts.Add(post);
                }
            }
            return posts;
        }
    }
}