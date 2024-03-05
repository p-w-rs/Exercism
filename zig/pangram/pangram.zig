fn toLowerAlpha(c: u8) ?u8 {
    if (c >= 'A' and c <= 'Z') return c | 0x20;
    if (c >= 'a' and c <= 'z') return c;
    return null;
}

pub fn isPangram(str: []const u8) bool {
    var mask: u32 = 0b011111111111111111111111111;
    for (str) |c| {
        if (toLowerAlpha(c)) |lowerChar| {
            mask &= ~(@as(u32, 1) << @truncate(lowerChar - 'a'));
        }
    }
    return mask == 0;
}
