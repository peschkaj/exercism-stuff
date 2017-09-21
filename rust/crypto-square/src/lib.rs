#![feature(iterator_step_by)]

extern crate itertools;
use itertools::Itertools;
use std::ascii::AsciiExt;

pub fn encrypt(message: &str) -> String {
    if message.is_empty() {
        return String::new();
    }

    let message: String = message
        .chars()
        .filter_map(|c| if c.is_ascii() && c.is_alphabetic() {
            Some(c.to_ascii_lowercase())
        } else {
            None
        })
        .collect();

    let l = message.len();

    let chunk_size = (l as f64).sqrt().ceil() as usize;

    (0..chunk_size)
        .into_iter()
        .map(|offset| {
            message
                .chars()
                .skip(offset)
                .step(chunk_size)
                .collect::<String>()
        })
        .join(" ")
}
