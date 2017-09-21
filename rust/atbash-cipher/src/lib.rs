// Inspired by http://exercism.io/submissions/fb582a6f657742bdb087c6e3162c509e
// and http://exercism.io/submissions/3294884e643a485ba1c367f370d16745

extern crate itertools;
use itertools::Itertools;

const CHUNK_SIZE: usize = 5;

pub fn decode(cypher: &str) -> String {
    cypher.chars().filter_map(encode_char).collect::<String>()
}

pub fn encode(plaintext: &str) -> String {
    plaintext
        .to_lowercase()
        .chars()
        .filter_map(encode_char)
        .chunks(CHUNK_SIZE)
        .into_iter()
        .map(|mut chunk| chunk.join(""))
        .join(" ")
}

fn encode_char(c: char) -> Option<char> {
    match c {
        'a'...'z' => Some(('z' as u8 - (c as u8 - 'a' as u8)) as char),
        '0'...'9' => Some(c),
        _ => None,
    }
}
