// To encrypt the private key for making it more secure
const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
    const encryptedJSONKey = await wallet.encrypt(process.env.PRIVATE_KEY_PASS, process.env.PRIVATE_KEY);

    console.log(encryptedJSONKey);
    fs.writeFileSync("./.encryptedKey.json", encryptedJSONKey);
    
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });