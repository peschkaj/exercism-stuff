pub fn find() -> Option<usize> {
    // we can likely implement many checks using the rules in
    // https://en.wikipedia.org/wiki/Pythagorean_triple#Elementary_properties_of_primitive_Pythagorean_triples

    let sum: usize = 1000;
    let sum_third: usize = sum / 3;
    let sum_half: usize = sum / 2;

    for a in 1..sum_third + 1 {
        for b in a + 1..sum_half {
            let c = sum - a - b;
            if (a.pow(2) + b.pow(2)) == c.pow(2) {
                return Some(a * b * c);
            }
        }
    }

    return None;
}
