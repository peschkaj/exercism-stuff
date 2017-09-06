pub struct PascalsTriangle {
    row_count: u32,
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        return PascalsTriangle { row_count: row_count };
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        match self.row_count {
            0 => Vec::new(),
            1 => vec![vec![1]],
            _ => {
                (1..self.row_count).fold(vec![vec![1]], |v, _| {
                    let x = vec![self.make_row(&v.last().unwrap())];
                    [v, x].concat()
                })
            }
        }
    }

    fn make_row(&self, v: &Vec<u32>) -> Vec<u32> {
        let zero = [0];
        let i1 = zero.iter().chain(v.iter());
        let i2 = v.iter().chain(zero.iter());

        // sum the two lists together.
        i1.zip(i2).map(|(a, b)| a + b).collect()
    }
}
