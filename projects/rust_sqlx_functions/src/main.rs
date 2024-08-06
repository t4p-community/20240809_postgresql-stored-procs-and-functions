use anyhow::Result;

mod dvdrental_db;

#[tokio::main]
async fn main() -> Result<()> {
    let db = dvdrental_db::DVDRentalDb::new().await?;

    // let total_payments = db.total_payments_for_film(879).await?;
    // println!("Total payments for film : {}", total_payments);

    Ok(())
}
