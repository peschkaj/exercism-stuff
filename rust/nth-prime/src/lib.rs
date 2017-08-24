use std::iter::once;
use std::iter::empty;
use std::f32;

pub fn nth(n: u32) -> Result<u32, &'static str> {
    if n == 0 {
        return Err("There is no 0th prime");
    } else if n == 1 {
        return Ok(2);
    } else if n == 2 {
        return Ok(3);
    }

    let ub = upper_bound(n);
    let primes = optimized_sieve(ub);

    let n = n - 1;

    for (i, prime) in primes.enumerate() {
        if i as u32 == n {
            return Ok(prime as u32);
        }
    }

    Result::Err("The prime is a lie")
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
