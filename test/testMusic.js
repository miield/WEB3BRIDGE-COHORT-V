const { expect } = require("chai");
const { ethers } = require("hardhat");
const assert = require('assert');
// const { isCallTrace } = require("hardhat/internal/hardhat-network/stack-traces/message-trace");
// require("ethers/lib//utils");
const asserttruffle = require("truffle-assertions");
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
        //     name: "Cool",
        //     genre: "Raggae",
        //     noOfSongs,
        //     songMetasss: [ utils.keccak256(utils.defaultAbiCoder.encode([ "uint", "address" ], [ Math.floor(Date.now() / 1000), address ])),
        // ]
        // }

        // user2 = {
            
        // }

    });

    it("Should return User Profile", async function () {
        const signup = await music.connect(signer2).signUp(user.username);
        const vProfile = await music.connect(signer2).viewProfile();
        assert.equal(vProfile.ownerAddress, signer2.address, "ownerAddress is correct");
        assert.equal(vProfile.username, "Miield", "username is correct");
        assert.equal(vProfile.isExist, true, "isExist is correct");
    })

})

