#[macro_use]
extern crate maplit;

use std::collections::HashMap;

const ACGT: [char; 4] = ['A', 'C', 'G', 'T'];

pub fn count(nucleotide: char, dna: &'static str) -> Result<usize, &'static str> {
    if ACGT.iter().all(|x| x != &nucleotide) || !dna.chars().all(|x| ACGT.contains(&x)) {
        return Err("mismatch");
    }

    Ok(
        dna.chars()
            .filter(|x| x == &nucleotide)
            .collect::<String>()
            .len(),
    )
}

pub fn nucleotide_counts<'a>(dna: &'a str) -> Result<HashMap<char, usize>, &'static str> {
    if !dna.chars().all(|x| ACGT.contains(&x)) {
        return Err("nope!");
    }

    let mut seen: HashMap<char, usize> =
        hashmap!(
        'A' => 0,
        'C' => 0,
        'G' => 0,
        'T' => 0);

    for nucleotide in dna.chars() {
        let e = seen.entry(nucleotide).or_insert(0 as usize);
        *e += 1;
    }
    Ok(seen)
}
