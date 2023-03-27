extern crate redis;
extern crate tokio;

use redis::AsyncCommands;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let redis_url = "redis://localhost:6380/0";

    let mut conn = redis::Client::open(redis_url)
        .expect("Invalid connection URL")
        .get_multiplexed_async_connection()
        .await
        .expect("failed to connect to Redis");

    let start = std::time::Instant::now();
    let large_data: Vec<u8> = conn.get("my_large_data").await?;
    assert_eq!(large_data[2000], 5u8);
    println!(
        "Successfully got \"my_large_data\" of size {}, that took {:?}",
        large_data.len(),
        start.elapsed(),
    );

    Ok(())
}
