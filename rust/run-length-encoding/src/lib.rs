pub fn encode(input: &str) -> String {
    if input.is_empty() {
        return input.into();
    }

    let mut counter = 1;
    let mut previous:char = input.chars().nth(0).unwrap();
    let mut encoded = String::new();


    for current in input.chars().skip(1) {
        if current == previous {
            counter += 1;
        } else {
            encoded.push_str(&encode_count(counter));
            encoded.push(previous);
            previous = current;

            counter = 1;
        }   
    }

    encoded.push_str(&encode_count(counter));
    encoded.push(previous);
    
    encoded
}

fn encode_count(count: usize) -> String {
    match count {
        1 => "".to_string(),
        _ => count.to_string(),
    }
}

pub fn decode(s: &str) -> String {
    if s.is_empty() {
        return s.into();
    }

    let mut number: String = String::new();
    let mut decoded: String = String::new();

    for c in s.chars() {
        if c.is_numeric() {
            number.push(c);
        } else {
            let n: usize = number.parse().unwrap_or(1);
            decoded.push_str(&c.to_string().repeat(n));
            number.clear();
        }
    }

    decoded
}