use anyhow::Result;
use sqlx::postgres::PgPoolOptions;
use sqlx::Row;

pub struct DVDRentalDb {
    pool: sqlx::PgPool,
}

impl DVDRentalDb {
    pub async fn new() -> Result<Self> {
        let pool = PgPoolOptions::new()
            .max_connections(5)
            .connect(
                format!(
                    "postgres://{}:{}@{}:{}/{}",
                    "postgres",
                    "zT2BeG0swpr3KpFmlyNO",
                    "database-demo.c3e042am240s.us-east-2.rds.amazonaws.com",
                    5432,
                    "dvdrental"
                )
                .as_str(),
            )
            .await?;
        Ok(Self { pool })
    }

    pub async fn insert_category(&self, name: &str) -> Result<()> {
        sqlx::query("CALL insert_category($1);")
            .bind(name)
            .execute(&self.pool) // Use `execute` instead of `fetch_one`
            .await?;

        Ok(())
    }

    pub async fn delete_category_by_name(&self, name: &str) -> Result<()> {
        sqlx::query("CALL delete_category_by_name($1);")
            .bind(name)
            .execute(&self.pool)
            .await?;

        Ok(())
    }

    pub async fn insert_category_and_return_id(&self, name: &str) -> Result<i32> {
        let row = sqlx::query("CALL insert_category($1, NULL);")
            .bind(name)
            .fetch_one(&self.pool)
            .await?;

        Ok(row.get::<i32, usize>(0))
    }
}
