pub fn sum_of_multiples(limit: usize, numbers: &Vec<usize>) -> usize {
    (1..limit).filter(|x| numbers.iter().any(|n| x % n == 0)).sum()
}
