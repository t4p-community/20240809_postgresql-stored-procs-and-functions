use anyhow::Result;

mod dvdrental_db;

#[tokio::main]
async fn main() -> Result<()> {
    let db = dvdrental_db::DVDRentalDb::new().await?;

    // db.insert_category("New Category").await?;

    // if let Err(_err) = db.delete_category_by_name("New Category").await {
    //     // might return this to user
    //     eprintln!("A database error occurred.");
    //     // log this out
    //     // eprintln!("Error: {:?}", _err);
    // }

    let new_category_id = db.insert_category_and_return_id("New Category").await?;
    println!("New Category ID: {}", new_category_id);

    Ok(())
}
