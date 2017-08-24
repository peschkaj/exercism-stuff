pub fn verse(v: u32) -> String {
    match v {
        0 => String::from("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"),
        1 => String::from(format!("{value} bottle of beer on the wall, {value} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n", value=v)),
        2 => String::from(format!("{value} bottles of beer on the wall, {value} bottles of beer.\nTake one down and pass it around, {next_value} bottle of beer on the wall.\n", value=v, next_value=v - 1)),
        _ => String::from(format!("{value} bottles of beer on the wall, {value} bottles of beer.\nTake one down and pass it around, {next_value} bottles of beer on the wall.\n", value=v, next_value=v - 1))
    }
}

pub fn sing(to: u32, from: u32) -> String {
    let mut s = String::new();

    for x in (from..to + 1).rev() {
        s.push_str(&verse(x));
        if x != from {
            s.push_str("\n");
        }
    }

    s
}