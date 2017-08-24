
pub fn is_leap_year(y: u32) -> bool {
    match y {
        _ if y % 400 == 0 => true,
        _ if y % 100 == 0 => false,
        _ if y % 4 == 0 => true,
        _ => false,
    }
}