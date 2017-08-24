pub fn difference(n: usize) -> usize {
    square_of_sum(n) - sum_of_squares(n)
}

pub fn square_of_sum(n: usize) -> usize {
    (1..n+1).sum::<usize>().pow(2)
}

pub fn sum_of_squares(n: usize) -> usize {
    (1..n+1).map(|x| x.pow(2)).sum::<usize>()
}