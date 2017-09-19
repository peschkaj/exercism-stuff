use std::collections::HashMap;

pub fn word_count(sentence: &str) -> HashMap<String, u32> {
    let words: Vec<&str> = sentence.split(|c: char| !c.is_alphanumeric()).filter(|&w| w != "").collect();

    let mut word_counts: HashMap<String, u32> = HashMap::new();

    for &word in words.iter() {
        let word = word.to_lowercase();
        let e = word_counts.entry(word).or_insert(0);
        *e += 1;
    }

    println!("{:?}", word_counts);
    
    word_counts
}