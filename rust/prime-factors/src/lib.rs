use std::iter::once;
use std::iter::empty;


pub fn factors(n: usize) -> Vec<usize> {
    if n <= 3 {
        return match n {
            1 => vec![],
            2 => vec![2 as usize],
            3 => vec![3 as usize],
            _ => panic!("I can't actually get here"),
        };
    }

    let all_primes: Vec<usize> = if n < 1024 {
        simple_sieve(n)
    } else {
        let ub = upper_bound(n as u32);
        optimized_sieve(ub).collect()
    };

    let mut prime_factors: Vec<usize> = vec![];

    let mut d = n;

    loop {
        for x in &all_primes {
            println!("testing {} in {}", x, n);

            if d % x == 0 {
                prime_factors.push(*x);
                d = d / x;
                break;
            }
        }

        if d == 1 {
            return prime_factors;
        }
    }
}

fn simple_sieve(limit: usize) -> Vec<usize> {
    let mut is_prime = vec![true; limit + 1];
    is_prime[0] = false;
    if limit >= 1 {
        is_prime[1] = false
    }

    for num in 2..limit + 1 {
        if is_prime[num] {
            let mut multiple = num * num;
            while multiple <= limit {
                is_prime[multiple] = false;
                multiple += num;
            }
        }
    }

    is_prime
        .iter()
        .enumerate()
        .filter_map(|(pr, &is_pr)| if is_pr { Some(pr) } else { None })
        .collect()
}

/// Computes an upper bound for the prime search
///
/// The upper bound is computed using an approximation:
///    n ln n + n ln ln n
/// Typically, this is combined with a lower bound and then a sieve is
/// performed between the upper and lower bounds.
fn upper_bound(n: u32) -> usize {
    let n = n as f32;

    ((n * f32::ln(n)) + (n * f32::ln(f32::ln(n)))) as usize
}

fn optimized_sieve(limit: usize) -> Box<Iterator<Item = usize>> {
    if limit < 3 {
        return if limit < 2 {
            Box::new(empty())
        } else {
            Box::new(once(2))
        };
    }

    let ndxlmt = (limit - 3) / 2 + 1;
    let bfsz = ((limit - 3) / 2) / 32 + 1;
    let mut cmpsts = vec![0u32; bfsz];
    let sqrtndxlmt = ((limit as f64).sqrt() as usize - 3) / 2 + 1;

    for ndx in 0..sqrtndxlmt {
        if (cmpsts[ndx >> 5] & (1u32 << (ndx & 31))) == 0 {
            let p = ndx + ndx + 3;
            let mut cullpos = (p * p - 3) / 2;
            while cullpos < ndxlmt {
                unsafe {
                    // avoids array bounds check, which is already done above
                    let cptr = cmpsts.get_unchecked_mut(cullpos >> 5);
                    *cptr |= 1u32 << (cullpos & 31);
                }
                cullpos += p;
            }
        }
    }

    Box::new((-1..ndxlmt as isize).into_iter().filter_map(
        move |i| if i < 0 {
            Some(2)
        } else {
            if cmpsts[i as usize >> 5] & (1u32 << (i & 31)) == 0 {
                Some((i + i + 3) as usize)
            } else {
                None
            }
        },
    ))
}
