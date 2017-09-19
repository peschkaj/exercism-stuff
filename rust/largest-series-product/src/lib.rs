#[derive(Debug)]
pub enum LSPError {
    IllegalLength,
}

pub fn lsp(number: &str, length: usize) -> Result<u32, LSPError> {
    if number.len() < length {
        return Err(LSPError::IllegalLength);
    }
    let digits: Vec<u32> = number.chars().filter_map(|c| c.to_digit(10)).collect();

    Ok(
        digits
            .windows(length)
            .map(|w| w.iter().product())
            .max()
            .unwrap_or(0),
    )
}
