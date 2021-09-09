const { expect } = require("chai");
const { ethers } = require("hardhat");
const { isCallTrace } = require("hardhat/internal/hardhat-network/stack-traces/message-trace");
require("ethers/lib//utils");
const assert = require("truffle-assertions");
require('chai').use(require('chai-as-promised')).should()

describe("Test Contract Music variables", async function() {
    let Music, music, signer1, signer2, user, user1, user2;
    before(async function() {
        Music = await ethers.getContractFactory("Music");
        music = await Music.deploy();
        const signers = await ethers.getSigners();
        signer1 = signers[0];
        signer2 = signers[1];

        user = {
            ownerAddress: signer2.address,
            username: "Miield",
            isExist: true
        }

        // user1 = {
        //     name: "Oyinda",
        //     genre: "RnB",
        //     songMetasss: utils.keccak256(utils.defaultAbiCoder.encode([ "uint", "address" ], [ Math.floor(Date.now() / 1000), address ])),
        // }

        // user2 = {
            
        // }

    });

    it("Should return boolean true", async function () {
        const signUp = await
    })

})

