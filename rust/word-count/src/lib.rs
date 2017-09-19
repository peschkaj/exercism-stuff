use std::collections::HashMap;

pub fn word_count(sentence: &str) -> HashMap<String, u32> {
    let mut word_counts: HashMap<String, u32> = HashMap::new();

    let words: Vec<String> = sentence
        .split(|c: char| !c.is_alphanumeric())
        .filter(|&w| w != "")
        .map(|w| w.to_lowercase())
        .collect();

    for word in words.iter() {
        let word = word.to_lowercase();
        *word_counts.entry(word).or_insert(0) += 1;
    }

    println!("{:?}", word_counts);

    word_counts
}