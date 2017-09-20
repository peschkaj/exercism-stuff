use std::collections::HashMap;

pub fn decode(cypher: &str) -> String {
    translate(cypher).chars().filter(|c| *c != ' ').collect::<String>()
}

pub fn encode(plaintext: &str) -> String {
    translate(plaintext)
}

fn translate(source: &str) -> String {
    let allowed = "abcdefghijklmnopqrstuvwxyz01233456789";
    let m = build_map();

    source
        .to_lowercase()
        .chars()
        .filter(|c| allowed.chars().any(|x| x == *c))
        .map(|c| if c.is_numeric() { c } else { m[&c] })
        .collect::<Vec<char>>()
        .chunks(5)
        .fold(String::new(), |mut s, chunk| {
            s.push_str(" ");
            s.push_str(&(*chunk).to_vec().into_iter().collect::<String>());
            s
        })
        .trim()
        .to_string()
}

fn build_map() -> HashMap<char, char> {
    let plain: Vec<char> = "abcdefghijklmnopqrstuvwxyz".chars().collect();
    let mut cypher = "zyxwvutsrqponmlkjihgfedcba".chars();

    plain.iter().fold(HashMap::new(), |mut map, p| {
        map.insert(*p, cypher.next().unwrap());
        map
    })
}
