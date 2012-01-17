unitDef = {
  unitname                      = [[factorygunship]],
  name                          = [[Gunship Plant]],
  description                   = [[Produces Gunships, Builds at 6 m/s]],
  acceleration                  = 0,
  brakeRate                     = 0,
  buildCostEnergy               = 550,
  buildCostMetal                = 550,
  builder                       = true,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 9,
  buildingGroundDecalSizeY      = 7,
  buildingGroundDecalType       = [[factorygunship_aoplane.dds]],

  buildoptions                  = {
    [[armca]],
    [[blastwing]],
    [[bladew]],
    [[armkam]],
    [[corape]],
    [[armbrawl]],
    [[blackdawn]],
    [[corcrw]],
    [[corvalk]],
    [[corbtrans]],
  },

  buildPic                      = [[factorygunship.png]],
  buildTime                     = 550,
  canMove                       = true,
  canPatrol                     = true,
  canstop                       = [[1]],
  category                      = [[FLOAT UNARMED]],
  collisionVolumeOffsets        = [[0 -5 0]],
  collisionVolumeScales         = [[95 50 95]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[cylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    landflystate   = [[1]],
	helptext = [[The Gunship Plant is designed for close air support. It includes a selection of transports for hauling land units around, and combat gunships which can perform a variety of offensive or defensive roles.]],
    description_de = [[Produziert Kampfhubschrauber, Baut mit 6 M/s]],
	helptext_de    = [[Kampfhubschrauber bieten aufgrund ihrer Beweglichkeit eine enorme Bandbreite an Einsetzbarkeit.]],
    sortName = [[3]],
  },

  energyMake                    = 0.225,
  energyUse                     = 0,
  explodeAs                     = [[LARGE_BUILDINGEX]],
  footprintX                    = 7,
  footprintZ                    = 7,
  iconType                      = [[facgunship]],
  idleAutoHeal                  = 5,
  idleTime                      = 1800,
  mass                          = 324,
  maxDamage                     = 4000,
  maxSlope                      = 15,
  maxVelocity                   = 0,
  metalMake                     = 0.225,
  minCloakDistance              = 150,
  noAutoFire                    = false,
  objectName                    = [[CORPLAS.s3o]],
  seismicSignature              = 4,
  selfDestructAs                = [[LARGE_BUILDINGEX]],
  showNanoSpray                 = false,
  side                          = [[CORE]],
  sightDistance                 = 273,
  smoothAnim                    = true,
  turnRate                      = 0,
  useBuildingGroundDecal        = true,
  waterline						= 0,
  workerTime                    = 6,
  yardMap                       = [[oooooooooooooooooooooooooooooooooooooooooooooooo]],

  featureDefs                   = {

    DEAD  = {
      description      = [[Wreckage - Gunship Plant]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 4000,
      energy           = 0,
      featureDead      = [[DEAD2]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 7,
      footprintZ       = 6,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 220,
      object           = [[corplas_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 220,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Gunship Plant]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 4000,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 6,
      footprintZ       = 6,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 110,
      object           = [[debris4x4c.s3o]],
      reclaimable      = true,
      reclaimTime      = 110,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ factorygunship = unitDef })
