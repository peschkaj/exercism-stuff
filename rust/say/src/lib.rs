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

    let mut s = String::new();
    let chunks = chunk_number(n);
    let length = chunks.len();

    println!("{:?}", chunks);

    for (position, &chunk) in chunks.iter().enumerate() {
        if chunk == 0 {
            continue;
        }
        s.push_str(get_hundreds(chunk).trim());
        s.push_str(position_to_string(length - (position + 1)));
        s.push_str(" ");
    }

    String::from(s.trim())
}

fn chunk_number(n: usize) -> Vec<usize> {
    let mut n = n;
    let mut chunks: Vec<usize> = vec!();
    let d: usize = 1000;

    while d < 999_999_999_999 && n > 0 {
        println!("{} % {} = {}", n, d, n % d);
        chunks.push(n % d);
        n /= 1000;
    }

    chunks.reverse();
    chunks
}

fn position_to_string(i: usize) -> &'static str {
    match i {
        3 => " billion",
        2 => " million",
        1 => " thousand",
        0 => "",
        _ => panic!("E_POSITION_TOO_LARGE"),
    }
}

fn get_hundreds(n: usize) -> String {
    let s = match n / 100 {
        9 => "nine hundred",
        8 => "eight hundred",
        7 => "seven hundred",
        6 => "six hundred",
        5 => "five hundred",
        4 => "four hundred",
        3 => "three hundred",
        2 => "two hundred",
        1 => "one hundred",
        0 => "",
        _ => panic!("what"),
    }.to_string();

    format!("{} {}", s, get_tens(n % 100))
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
        0 => get_teens(n),
        _ => panic!("what"),
    }.to_string();

    if n > 20 && n % 10 != 0 {
        s.push_str("-");
        s.push_str(get_teens(n % 10));
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
        0 => "",
        _ => panic!("what"),
    }
}
