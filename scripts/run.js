async function main() {
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract deployed to:", waveContract.address);
}

main()
    .then (() => process.exit(0))
    .catch((err) => {
        console.log(err);
        process.exit(1);
    });