const alphabet = "abcdefghijklmnopqrstuvwxyz";
const score_table = make_score_table();

fn value(c: u8) u32 {
    return switch (c) {
        'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => 1,
        'd', 'g' => 2,
        'b', 'c', 'm', 'p' => 3,
        'f', 'h', 'v', 'w', 'y' => 4,
        'k' => 5,
        'j', 'x' => 8,
        'q', 'z' => 10,
        else => 0,
    };
}

fn make_score_table() [26]u32 {
    var map: [26]u32 = undefined;
    for (alphabet, 0..26) |c, i| {
        map[i] = value(c);
    }
    return map;
}

fn tolower(c: u8) u8 {
    return if (c >= 'A' and c <= 'Z') c | 0x20 else c;
}

pub fn score(s: []const u8) u32 {
    var total: u32 = 0;
    for (s) |c| {
        total += score_table[tolower(c) - 'a'];
    }
    return total;
}
