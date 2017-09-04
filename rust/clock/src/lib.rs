use std::fmt;

#[derive(Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Clock {
        let overflow_hours_from_minutes = if minutes < 0 {
            (minutes / 60) - 1
        } else {
            minutes / 60
        };

        let h = hours + overflow_hours_from_minutes;

        let mut hours = if hours < 0 {
            24 - (hours.abs() % 24)
        } else {
            hours % 24
        };
        
        // Take only the minutes portion of `minutes` and set it aside.
        let mut m = if minutes < 0 {
            60 - (minutes.abs() % 60)
        } else {
            minutes
        };

        hours += overflow_hours_from_minutes;

        if hours < 0 {
            hours = 24 + (hours % 24);
        }
        
        Clock {
            hours: hours % 24,
            minutes: m % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Clock {
        Clock::new(self.hours, self.minutes + minutes)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Clock) -> bool {
        self.hours == other.hours && self.minutes == other.minutes
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
