#[derive(Debug)]
pub enum LSPError {
    IllegalLength,
    IllegalCharacters,
}

pub fn lsp(number: &str, length: usize) -> Result<u32, LSPError> {
    if number.len() < length {
        return Err(LSPError::IllegalLength);
    }

    if length == 0 || number.is_empty() {
        return Ok(1);
    }

    if number.chars().any(|c| !c.is_numeric()) {
        return Err(LSPError::IllegalCharacters);
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
