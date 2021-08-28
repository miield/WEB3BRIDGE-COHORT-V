const {utils} = require('ethers')
const { checkAddressChecksum } = require('ethereum-checksum-address')

class Bank {
    constructor(address){
        this.admin = address;       
    }

    UserHash = new Array()
    checkAllowance = new Array();
    Customers = [];
    globalHash;
    User = {
        name:'',
        age:'',
        address:'',
        createdAt:''
    }
    register (name, age, address){
        if(!checkAddressChecksum(address)) return 'invalid checksum'
        let hash = utils.keccak256(utils.defaultAbiCoder.encode([ "string", "address" ], [ name, address ]))
        this.User = {
            name:name,
            age:age,
            createdAt:Date(),
            address:address
        }
        this.UserHash[hash] = this.User
       // console.log('customer to hash', this.CustomerToHash[hash])
        this.globalHash  = hash;
      //  console.log('hash', hash)
    }   
    // allowed address
  canCheck (_address, _msgSender, userHash_){
    let user =   this.UserHash[userHash_]
   // console.log('can check customer',customer)
    if(user.address ===_msgSender) {
    //  this.CanCheck[_customerHash].push(_address)
    if(this.checkAllowance[userHash_] ==undefined){
        this.checkAllowance[userHash_] = [_address]
    } else {
        let c = this.checkAllowance[userHash_]
        let addr = [...c, _address]
        this.checkAllowance[userHash_] = addr
        console.log('chwcking', this.checkAllowance[userHash_] )
    }
      return 'success'  
    } else {
        return 'not authorized';
    }
  }
  checkCustomerDetails (address, userHash_) {
    let users =   this.UserHash[userHash_]
    let usrr = this.checkAllowance[userHash_];
    if(address == this.admin ||( address == users.address)  ) {
            console.log('owner and admin only',users)
        return users;
    } else {
        if(usrr.length ==0) return 'not approved to check';
        for (let index = 0; index < usrr.length; index++) {
            if(address == usrr[index]){
                console.log('Not allowed to view', users)
                return users;
            } else {
                return 'not allowed'
            }
        }
    }   
    //
    }
}
const myBank = new Bank('0x03f3CDCa46ab87208f5574F88Af1CD06E5edfb9A');
myBank.register('akt', 10, '0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2')
myBank.canCheck('0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C','0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2', myBank.globalHash )
myBank.checkCustomerDetails ('0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C', myBank.globalHash)