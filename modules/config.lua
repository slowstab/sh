-- Licensed under the Open Software License version 3.0

_G.prefix = ">"
_G.botToken = assert(FileReader.readFileSync("./token"))
_G.njallaToken = assert(FileReader.readFileSync("./njalla"))
_G.botColor = 0xa57562
_G.successColor = 0x43B581
_G.successEmote = "<:shSuccess:835619376052174848>"
_G.failColor = 0xEA4445
_G.failEmote = "<:shError:835619357249241159>"