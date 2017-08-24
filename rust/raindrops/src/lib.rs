pub fn raindrops(n: u32) -> String {
    let factors = [3, 5, 7];
    let strings = ["Pling", "Plang", "Plong"];
    let mut s = String::from("");

    for (i, &item) in factors.iter().enumerate() {
        if n % item == 0 {
            s.push_str(strings[i]);
        }
    }

    if s.is_empty() {
        n.to_string()
    } else {
        s
    }
}

