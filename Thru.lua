local app = app
local Class = require "Base.Class"
local Unit = require "Unit"

local Thru = Class {}
Thru:include(Unit)

function Thru:init(args)
  args.title = "Thru"
  args.mnemonic = "Th"
  args.version = 1
  Unit.init(self, args)
end

function Thru:onLoadGraph(channelCount)
  if channelCount == 2 then
    self:loadStereoGraph()
    self.objects.outGain1:hardSet("Gain", 1.0)
    self.objects.outGain2:hardSet("Gain", 1.0)
  else
    self:loadMonoGraph()
    self.objects.outGain:hardSet("Gain", 1.0)
  end
end

function Thru:loadMonoGraph()
  local outGain = self:addObject("outGain", app.ConstantGain())
  connect(self, "In1", outGain, "In")
  connect(outGain, "Out", self, "Out1")
end

function Thru:loadStereoGraph()
  local outGain1 = self:addObject("outGain1", app.ConstantGain())
  connect(self, "In1", outGain1, "In")
  connect(outGain1, "Out", self, "Out1")
  
  local outGain2 = self:addObject("outGain2", app.ConstantGain())
  connect(self, "In2", outGain2, "In")
  connect(outGain2, "Out", self, "Out2")
end

return Thru