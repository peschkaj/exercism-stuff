pub fn build_proverb(pieces: Vec<&str>) -> String {
    if pieces.len() == 0 {
        return String::new();
    }

    let mut s = String::new();

    for i in 1..pieces.len() {
        s.push_str(format!("For want of a {} the {} was lost.\n", pieces[i - 1], pieces[i]).as_str());
    }

    s.push_str("And all for the want of a ");

    if pieces.len() > 2 {
        s.push_str(format!("{}{} {}.", pieces[2], pieces[1], pieces[0]).as_str());
    } else {
        s.push_str(format!("{}.", pieces[0]).as_str());
    }

    s
}