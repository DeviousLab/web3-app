async function main() {
    const [owner, randoPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);

    let waveCount = await waveContract.getTotalWaves();
    console.log("Total waves:", waveCount.toNumber());

    let waveTxn = await waveContract.wave("A message");
    await waveTxn.wait();

    waveTxn = await waveContract.wave("Another message");
    await waveTxn.wait();

    let allWaves = await waveContract.getAllWaves();
    console.log("All waves:", allWaves);

    let userWaves= await waveContract.getUserWaves(owner.address);
    console.log("User waves:", userWaves);
}

main()
    .then(() => process.exit(0))
    .catch((err) => {
        console.log(err);
        process.exit(1);
    });