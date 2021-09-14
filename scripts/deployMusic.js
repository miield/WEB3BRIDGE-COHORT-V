const hre = require("hardhat");

async function main() {
    const Music = await hre.ethers.getContractFactory("Music");
    const music = await Music.deploy();

    await music.deployed();
    console.log("Music deployed to:", music.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });