extern crate redis;

use redis::Commands;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let redis_url = "redis://localhost:6380/0";

    let mut conn = redis::Client::open(redis_url)
        .expect("Invalid connection URL")
        .get_connection()
        .expect("failed to connect to Redis");

    let mut large_data = vec![u8::default(); 49_152_000];
    large_data[2000] = 5u8;

    let start = std::time::Instant::now();
    conn.set("my_large_data", &large_data)?;
    println!(
        "Successfully set \"my_large_data\" of size {}, that took {:?}",
        large_data.len(),
        start.elapsed(),
    );

    Ok(())
}
