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

    pub async fn total_payments_for_film(&self, film_id: i32) -> Result<f64> {
        let select_sql = r#"
            select CAST(get_total_payments_for_film($1) as FLOAT8) as total_payments;
        "#;

        let rows = sqlx::query(select_sql)
            .bind(film_id)
            .fetch_all(&self.pool)
            .await?;

        let total_payments: f64 = rows[0].try_get("total_payments")?;

        Ok(total_payments)
    }
}
