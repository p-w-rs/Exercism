pub const ComputationError = error{IllegalArgument};

pub fn collatz(n: usize) usize {
    if (n % 2 == 0) {
        return n / 2;
    } else {
        return 3 * n + 1;
    }
    unreachable;
}

pub fn steps(number: usize) anyerror!usize {
    var n: usize = number;
    var nsteps: usize = 0;
    while (n > 1) {
        n = collatz(n);
        nsteps += 1;
    }

    if (n < 1) {
        return error.IllegalArgument;
    } else {
        return nsteps;
    }
}
