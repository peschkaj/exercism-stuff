pub fn hamming_distance(first: &str, second: &str) -> Result<usize, &'static str> {
    let mut count: usize = 0;

    if first.len() != second.len() {
        return Err("different lengths");
    }

    
        Ok(first.chars().zip(second.chars()).filter(|&(a, b)| a != b).count())
}