//
// See Rust Language Specific Instructions
// below normal exercise description.
//
pub fn encode(n: usize) -> String {
    if n == 0 {
        return String::from("zero");
    }

    if n > 999_999_999_999 {
        panic!("E_NUMBER_TOO_BIG");
    }

    if n >= 20 {
        get_tens(n)
    } else {
        String::from(get_teens(n))
    }
}

fn get_tens(n: usize) -> String {
    let mut s = match n / 10 {
        9 => "ninety",
        8 => "eighty",
        7 => "seven",
        6 => "sixty",
        5 => "fifty",
        4 => "forty",
        3 => "thirty",
        2 => "twenty",
        1 => get_teens(n),
        0 => "",
        _ => panic!("what"),
    }.to_string();

    if n > 20 && n % 10 != 0 {
        s.push_str("-");
        s.push_str(get_teens(n / 10));
    }

    s
}

fn get_teens(n: usize) -> &'static str {
    match n {
        19 => "nineteen",
        18 => "eighteen",
        17 => "seventeen",
        16 => "sixteen",
        15 => "fifteen",
        14 => "fourteen",
        13 => "thirteen",
        12 => "twelve",
        11 => "eleven",
        10 => "ten",
        9 => "nine",
        8 => "eight",
        7 => "seven",
        6 => "six",
        5 => "five",
        4 => "four",
        3 => "three",
        2 => "two",
        1 => "one",
        _ => panic!("what"),
    }
}
