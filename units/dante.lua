unitDef = {
  unitname            = [[dante]],
  name                = [[Dante]],
  description         = [[Assault/Riot Strider]],
  acceleration        = 0.0984,
  bmcode              = [[1]],
  brakeRate           = 0.2392,
  buildCostEnergy     = 3500,
  buildCostMetal      = 3500,
  builder             = false,
  buildPic            = [[dante.png]],
  buildTime           = 3500,
  canAttack           = true,
  canDGun             = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND]],
  collisionVolumeScales		= [[72 82 72]],
  collisionVolumeOffsets	= [[0 -3 0]],  
  collisionVolumeTest	    = 1,
  collisionVolumeType	    = [[ellipsoid]],
  corpse              = [[DEAD]],
  
  customParams        = {
    description_fr = [[Mechwarrior d'Assaut]],
	description_de = [[Sturm/Riotroboter]],
    helptext       = [[The Dante is a heavy frontal assault unit for when conventional means don't cut it. Its flamethrower and twin heatrays aren't extraordinary, but its incendiary rockets can be fired in a salvo of twenty that devastates a wide swath of terrain.]],
    helptext_fr    = [[]],
	helptext_de    = [[Der Dante ist eine schwere Sturmeinheit f�r den Fronteinsatz, wenn herk�mmliche Mittel versagen. Sein Flammenwerfer und doppell�ufiger Heat Ray sind zwar nichts besonderes, doch seine Brandraketen k�nnen in 20-Schuss Salven breite Schneisen in das Gel�nde schlagen.]],
  },

  explodeAs           = [[CRAWL_BLASTSML]],
  footprintX          = 4,
  footprintZ          = 4,
  iconType            = [[t3riot]],
  idleAutoHeal        = 5,
  idleTime            = 1800,
  leaveTracks         = true,
  mass                = 716,
  maxDamage           = 11000,
  maxSlope            = 36,
  maxVelocity         = 1.75,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[KBOT4]],
  noAutoFire          = false,
  noChaseCategory     = [[TERRAFORM SATELLITE SUB]],
  objectName          = [[dante.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[CRAWL_BLASTSML]],

  sfxtypes            = {

    explosiongenerators = {
      [[custom:SLASHMUZZLE]],
      [[custom:SLASHREARMUZZLE]],
      [[custom:RAIDMUZZLE]],
    },
  },

  side                = [[CORE]],
  sightDistance       = 600,
  smoothAnim          = true,
  trackOffset         = 0,
  trackStrength       = 8,
  trackStretch        = 0.6,
  trackType           = [[ComTrack]],
  trackWidth          = 38,
  turnRate            = 597,
  upright             = true,
  workerTime          = 0,

  weapons             = {

    {
      def                = [[NAPALM_ROCKETS]],
      badTargetCategory  = [[FIXEDWING GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    {
      def                = [[HEATRAY]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    {
      def                = [[NAPALM_ROCKETS_SALVO]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    {
      def                = [[DANTE_FLAMER]],
      badTargetCategory  = [[FIREPROOF]],
      onlyTargetCategory = [[SWIM LAND SINK FLOAT SHIP HOVER GUNSHIP FIXEDWING]],
    },

  },


  weaponDefs          = {

    DANTE_FLAMER         = {
      name                    = [[Flame Thrower]],
      areaOfEffect            = 96,
      avoidFeature            = false,
      collideFeature          = false,
      craterBoost             = 0,
      craterMult              = 0,
	  
	  customParams        	  = {
	    setunitsonfire = "1",
		burntime = [[540]],		
	  },

      damage                  = {
        default = 15,
        subs    = 0.15,
      },

      explosionGenerator      = [[custom:SMOKE]],
      fireStarter             = 150,
      flameGfxTime            = 1.6,
      impulseBoost            = 0,
      impulseFactor           = 0,
      intensity               = 0.1,
      interceptedByShieldType = 0,
      noExplode               = true,
      range                   = 340,
      reloadtime              = 0.16,
      sizeGrowth              = 1.4,
      soundStart              = [[weapon/flamethrower]],
      soundTrigger            = true,
      sprayAngle              = 40000,
      tolerance               = 2500,
      turret                  = true,
      weaponType              = [[Flame]],
      weaponVelocity          = 800,
    },


    HEATRAY              = {
      name                    = [[Heat Ray]],
      accuracy                = 512,
      areaOfEffect            = 20,
      beamWeapon              = true,
      cegTag                  = [[HEATRAY_CEG]],
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 49,
        planes  = 49,
        subs    = 2.45,
      },

      duration                = 0.3,
      dynDamageExp            = 1,
      dynDamageInverted       = false,
      explosionGenerator      = [[custom:HEATRAY_HIT]],
      fallOffRate             = 1,
      fireStarter             = 90,
      heightMod               = 1,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      lodDistance             = 10000,
      projectiles             = 2,
      proximityPriority       = 4,
      range                   = 430,
      reloadtime              = 0.1,
      rgbColor                = [[1 0.1 0]],
      rgbColor2               = [[1 1 0.25]],
      soundStart              = [[weapon/heatray_fire]],
      thickness               = 3,
      tolerance               = 5000,
      turret                  = true,
      weaponType              = [[LaserCannon]],
      weaponVelocity          = 500,
    },


    NAPALM_ROCKETS       = {
      name                    = [[Napalm Rockets]],
      accuracy                = 1500,
      areaOfEffect            = 228,
      burst                   = 2,
      burstrate               = 0.1,
	  cegTag                  = [[missiletrailredsmall]],
      craterBoost             = 1,
      craterMult              = 2,

	  customParams        	  = {
	    setunitsonfire = "1",
	  },
	  
      damage                  = {
        default = 120,
        subs    = 6,
      },

      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:napalm_koda]],,
      fireStarter             = 250,
      fixedlauncher           = true,
      flightTime              = 4,
      impulseBoost            = 0,
      impulseFactor           = 0.1,
      interceptedByShieldType = 2,
      model                   = [[wep_m_hailstorm.s3o]],
      range                   = 460,
      reloadtime              = 2,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
      soundHit                = [[weapon/missile/rapid_rocket_hit]],
      soundStart              = [[weapon/missile/rapid_rocket_fire]],
      soundwater              = [[SplsSml]],
      sprayAngle              = 1000,
      startsmoke              = [[1]],
      startVelocity           = 150,
      tolerance               = 6500,
      tracks                  = false,
      turnRate                = 8000,
      turret                  = true,
      weaponAcceleration      = 100,
      weaponTimer             = 2.2,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 800,
      wobble                  = 10000,
    },


    NAPALM_ROCKETS_SALVO = {
      name                    = [[Napalm Rocket Salvo]],
      accuracy                = 1500,
      areaOfEffect            = 228,
      avoidFeature            = false,
      avoidFriendly           = false,
      avoidNeutral            = false,
      burst                   = 10,
      burstrate               = 0.1,
	  cegTag                  = [[missiletrailredsmall]],
      commandfire             = true,
      craterBoost             = 1,
      craterMult              = 2,

	  customParams        	  = {
	    setunitsonfire = "1",
	  },
	  
      damage                  = {
        default = 120,
        subs    = 6,
      },

      dance                   = 10,
      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:napalm_koda]],,
      fireStarter             = 250,
      fixedlauncher           = true,
      flightTime              = 4,
      impulseBoost            = 0,
      impulseFactor           = 0.1,
      interceptedByShieldType = 2,
      model                   = [[wep_m_hailstorm.s3o]],
	  projectiles			  = 2,
      range                   = 460,
      reloadtime              = 20,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
      soundHit                = [[weapon/missile/rapid_rocket_hit]],
      soundStart              = [[weapon/missile/rapid_rocket_fire]],
      soundwater              = [[SplsSml]],
      sprayAngle              = 3000,
      startsmoke              = [[1]],
      startVelocity           = 150,
      tolerance               = 6500,
      tracks                  = false,
      turnRate                = 5000,
      turret                  = true,
      weaponAcceleration      = 100,
      weaponTimer             = 2.2,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 800,
      wobble                  = 10000,
    },

  },


  featureDefs         = {

    DEAD  = {
      description      = [[Wreckage - Dante]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 11000,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[40]],
      hitdensity       = [[100]],
      metal            = 1400,
      object           = [[dante_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 1400,
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Dante]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 11000,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 4,
      footprintZ       = 4,
      hitdensity       = [[100]],
      metal            = 700,
      object           = [[debris4x4c.s3o]],
      reclaimable      = true,
      reclaimTime      = 70,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ dante = unitDef })
