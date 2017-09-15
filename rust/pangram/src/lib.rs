use std::collections::HashSet;
use std::iter::FromIterator;

pub fn is_pangram(sentence: &'static str) -> bool {
    let hs: HashSet<char> = HashSet::from_iter(sentence.chars().filter(|x| x.is_alphabetic()));

    hs.len() >= 26
}
