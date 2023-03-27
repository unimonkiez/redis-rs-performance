import { createClient, commandOptions } from 'redis';


const start = async () => {
    const redisUrl = "redis://localhost:6380/0";

    const client = createClient({ url: redisUrl, });
    await client.connect();

    const start = Date.now();
    const large_data = await client.get(commandOptions({ returnBuffers: true }), "my_large_data");
    if (large_data[2000] !== 5) {
        throw new Error("Expected \"large_data[2000]\" == 5u8");
    }
    console.log(`Successfully got \"my_large_data\" of size ${large_data.length}, that took ${Date.now() - start}ms`);

    await client.disconnect();
}

start();
