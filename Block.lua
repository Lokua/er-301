local Class = require "Base.Class"
local Unit = require "Unit"

local Block = Class {}
Block:include(Unit)

function Block:init(args)
  args.title = "Block"
  args.mnemonic = "BL"
  args.version = 1
  Unit.init(self, args)
end

return Block