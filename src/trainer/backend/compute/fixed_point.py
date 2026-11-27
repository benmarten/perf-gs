# Copyright (c) 2026 Electronic Arts Inc. All rights reserved.

"""Platform-specific fixed-point accumulator formats shared by Python and Slang setup."""

from __future__ import annotations

import sys

import numpy as np

IS_MACOS = sys.platform == "darwin"
FIXED_POINT_SCALE = 4096.0 if IS_MACOS else 65536.0
ETA_FIXED_SCALE = 65536.0
FIXED_POINT_DTYPE = np.int32 if IS_MACOS else np.int64
FIXED_POINT_BUFFER_DTYPE = "int" if IS_MACOS else "int64_t"


def fixed_point_shader_defines() -> dict[str, str]:
    """Return shader macros matching the Python buffer dtype and decode scale."""
    if not IS_MACOS:
        return {}
    return {"FIXED_POINT_INT32": "1"}
