syntax keyword Type u8 u16 u32 u64 unint s8 s16 s32 s64 nint f32 f64
syntax keyword Keyword global
syntax match Type /\v(SDL_)?[A-Z][A-Za-z]+(\s|$)/
syntax match Constant /\v<[A-Z_]+>\ze/
syntax match Function /\v\k+\ze\(/

