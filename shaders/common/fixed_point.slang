// Copyright (c) 2026 Electronic Arts Inc. All rights reserved.

#ifndef TRAINER_FIXED_POINT_SLANG
#define TRAINER_FIXED_POINT_SLANG

// Fixed-point atomic gradient accumulation. Apple GPUs routed through MoltenVK
// use 32-bit atomics; other backends retain the full-range 64-bit accumulator.
#ifdef FIXED_POINT_INT32
#define fixed_t int
static const float FIXED_SCALE = 4096.0;
#else
#define fixed_t int64_t
static const float FIXED_SCALE = 65536.0;
#endif
static const float FIXED_INV_SCALE = 1.0 / FIXED_SCALE;

fixed_t toFixed(float value) { return fixed_t(value * FIXED_SCALE); }
float fromFixed(fixed_t value) { return float(value) * FIXED_INV_SCALE; }

#endif // TRAINER_FIXED_POINT_SLANG
