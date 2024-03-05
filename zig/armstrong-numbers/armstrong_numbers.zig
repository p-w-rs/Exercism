const std = @import("std");

fn numberOfDigits(num: u128) u64 {
    if (num == 0) return 1;
    return std.math.log10_int(num) + 1;
}

pub fn isArmstrongNumber(num: u128) bool {
    var digits: u64 = numberOfDigits(num);
    var temp: u128 = num;
    var sum: u128 = 0;

    while (temp > 0) {
        sum += std.math.pow(u128, temp % 10, digits);
        temp /= 10;
    }

    return sum == num;
}
