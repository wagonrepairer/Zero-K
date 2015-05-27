unitDef = {
  unitname            = [[armtboat]],
  name                = [[Surfboard]],
  description         = [[Transport Platform]],
  acceleration        = 0.102,
  brakeRate           = 0.115,
  buildAngle          = 16384,
  buildCostEnergy     = 220,
  buildCostMetal      = 220,
  builder             = false,
  buildPic            = [[armtboat.png]],
  buildTime           = 220,
  canAttack           = false,
  canMove             = true,
  category            = [[SHIP UNARMED]],
  collisionVolumeOffsets = [[0 0 -3]],
  collisionVolumeScales  = [[35 20 55]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[ellipsoid]],  
  corpse              = [[DEAD]],

  customParams        = {
    description_de = [[Transportboot]],
    description_fr = [[Barge de Transport]],
    description_pl = [[Platforma Transportowa]],
    helptext       = [[The Surfboard serves as a naval transport and firing platform--that is, any unit on the Surfboard can fire off of it.]],
    helptext_de    = [[Das Surfboard bietet sich als Wassertransportmittel und als Feuerplattform an, denn alle auf dem Surfboard transportierten Einheiten können weiter feuern.]],
    helptext_fr    = [[Le Surfboard est un navire de transport et une plateforme de tir. Les unités transportées peuvent se servir de leurs armes.]],
    helptext_pl    = [[Surfboard to platforma transportowa - jednostki, ktore przewozi, sa w stanie atakowac z pokladu.]],
	turnatfullspeed = [[1]],
    modelradius    = [[15]],
  },

  explodeAs           = [[BIG_UNITEX]],
  floater             = true,
  footprintX          = 4,
  footprintZ          = 4,
  holdSteady          = true,
  iconType            = [[shiptransport]],
  idleAutoHeal        = 5,
  idleTime            = 1800,
  isFirePlatform      = true,
  maxDamage           = 1200,
  maxVelocity         = 3.3,
  minCloakDistance    = 75,
  movementClass       = [[BOAT4]],
  noChaseCategory     = [[TERRAFORM FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK TURRET]],
  objectName          = [[ARMTBOAT]],
  releaseHeld         = true,
  script              = [[armtboat.lua]],
  seismicSignature    = 4,
  selfDestructAs      = [[BIG_UNITEX]],
  sightDistance       = 325,
  transportCapacity   = 1,
  transportSize       = 3,
  turnRate            = 590,

  featureDefs         = {

    DEAD  = {
      description      = [[Wreckage - Surfboard]],
      blocking         = false,
      damage           = 1200,
      energy           = 0,
      featureDead      = [[DEAD2]],
      footprintX       = 4,
      footprintZ       = 4,
      metal            = 88,
      object           = [[surfboard_d.dae]],
      reclaimable      = true,
      reclaimTime      = 88,
    },

    DEAD2 = {
      description      = [[Debris - Surfboard]],
      blocking         = false,
      damage           = 1200,
      energy           = 0,
      featureDead      = [[HEAP]],
      footprintX       = 4,
      footprintZ       = 4,
      metal            = 88,
      object           = [[debris3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 88,
    },

    HEAP  = {
      description      = [[Debris - Surfboard]],
      blocking         = false,
      damage           = 1200,
      energy           = 0,
      footprintX       = 4,
      footprintZ       = 4,
      metal            = 44,
      object           = [[debris3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 44,
    },

  },

}

return lowerkeys({ armtboat = unitDef })
