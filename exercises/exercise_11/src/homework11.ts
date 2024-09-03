// import "dotenv";
import { Account, Aptos, AptosConfig, Network,  NetworkToNetworkName  } from "@aptos-labs/ts-sdk";

const INITIAL_BALANCE = 100_000_000;

const APTOS_NETWORK: Network = NetworkToNetworkName[process.env.APTOS_NETWORK]  ||  Network.TESTNET;
const config = new AptosConfig({ network: APTOS_NETWORK });
const aptos = new Aptos(config);

const createCollectionAndToken = async () => {
    console.log("Creating a collection and a token on the Aptos blockchain");

    // Generate an account (Gideon) to create the collection and token
    const bene = Account.generate();

    console.log("=== Gideon's Address ===\n");
    console.log(`Gideon's address is: ${bene.accountAddress}`);

    // Fund Gideon's account
    await aptos.fundAccount({
        accountAddress: bene.accountAddress,
        amount: INITIAL_BALANCE
    });

    // Define collection details
    const collectionName = "0x83N3";
    const collectionDescription = "This is Gideon's first collection of NFTs";
    const collectionURI = "https://aptos.dev";

    // Create the collection
    const createCollectionTransaction = await aptos.createCollectionTransaction({
        creator: bene,
        description: collectionDescription,
        name: collectionName,
        uri: collectionURI
    });

    console.log("=== Creating Collection ===\n");
    let committedTxn = await aptos.signAndSubmitTransaction({
        signer: bene,
        transaction: createCollectionTransaction
    });
    let pendingTxn = await aptos.waitForTransaction({ transactionHash: committedTxn.hash });

    console.log("=== Collection Created Successfully ===\n");

    // Verify collection creation
    const gideonCollection = await aptos.getCollectionData({
        creatorAddress: bene.accountAddress,
        collectionName,
        minimumLedgerVersion: BigInt(pendingTxn.version),
    });
    console.log(`Gideon's collection data: ${JSON.stringify(gideonCollection, null, 4)}`);

    // Define token details
    const tokenName = "0x83N3-NFT";
    const tokenDescription = "This is Gideon's first NFT token.";
    const tokenURI = "https://aptos.dev/token";

    console.log("\n=== Minting Token ===\n");

    // Create the token in the collection
    const mintTokenTransaction = await aptos.mintDigitalAssetTransaction({
        creator: bene,
        collection: collectionName,
        description: tokenDescription,
        name: tokenName,
        uri: tokenURI
    });
    
    committedTxn = await aptos.signAndSubmitTransaction({
        signer: bene,
        transaction: mintTokenTransaction
    });
    pendingTxn = await aptos.waitForTransaction({ transactionHash: committedTxn.hash });

    console.log("=== Token Minted Successfully ===\n");

    // Verify token creation
    const gideonToken = await aptos.getOwnedDigitalAssets({
        ownerAddress: bene.accountAddress,
        minimumLedgerVersion: BigInt(pendingTxn.version),
    });
    console.log(`Gideon's token data: ${JSON.stringify(gideonToken[0], null, 4)}`);
};

// Execute the function
createCollectionAndToken().catch(console.error);