fn toLowerAlpha(c: u8) ?u8 {
    if (c >= 'A' and c <= 'Z') return c | 0x20;
    if (c >= 'a' and c <= 'z') return c;
    return null;
}

pub fn isIsogram(str: []const u8) bool {
    var mask: u32 = 0b000000_00000000000000000000000000;
    for (str) |c| {
        if (toLowerAlpha(c)) |lowerChar| {
            var bit: u8 = lowerChar - 'a';
            if (mask & (@as(u32, 1) << @truncate(bit)) > 0) return false;
            mask |= @as(u32, 1) << @truncate(bit);
        }
    }
    return true;
}
