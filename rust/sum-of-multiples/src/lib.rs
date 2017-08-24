pub fn sum_of_multiples(limit: usize, numbers: &Vec<usize>) -> usize {
    (1..limit).fold(0, |sum, x| {
        sum +
            if numbers.iter().any(|n| x % n == 0) {
                x
            } else {
                0
            }
    })
}
