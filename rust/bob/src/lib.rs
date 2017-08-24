pub fn reply(s: &str) -> &str {
    let s = s.trim();

    if s.is_empty() {
        return "Fine. Be that way!";
    }

    // Yelling is defined as all caps"
    if is_shout(s) == true {
        println!("{} is a shout", s);
        return "Whoa, chill out!"
    }
    
    let last = {
        match s.char_indices().rev().nth(0) {
            Some((i, _)) => &s[i..],
            None => "",
        }
    };

    match last {
        "?" => "Sure.",
        _ => "Whatever.",
    }
}

fn is_shout(s: &str) -> bool {
    let s = s.chars().filter(|x| x.is_alphabetic()).collect::<String>();

    // Have to check if s is empty since empty iterators return true for .all()
    if s.is_empty() == true {
        false
    } else {
        s.chars().all(|x| x.is_uppercase())
    }
}