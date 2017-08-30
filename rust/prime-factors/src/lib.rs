pub fn factors(n: usize) -> Vec<usize> {
    let mut factors = Vec::new();

    if n == 1 {
        return factors;
    }

    let mut d = n;

    while d != 1 {
        for i in 2.. {
            if d % i == 0 {
                factors.push(i);
                d = d / i;
                break;
            }
        }
    }

    factors
}
