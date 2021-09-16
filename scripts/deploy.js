async function main() {
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy({value: ethers.utils.parseEther("0.1")});
    await waveContract.deployed();
    console.log('WavePortal address:', token.address);
}

main()
    .then(() => process.exit(0))
    .catch((err) => {
        console.error(err);
        process.exit(1);
    });