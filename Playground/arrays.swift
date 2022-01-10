// Create an array for the days of the week in a non English language of your choice. (German)
var daysOfWeek = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"]

// Print out each day of the week on a separate line
for day in daysOfWeek {
  print(day)
}

// Print out the number of days of the week (using count)
var numDays = 0
for _ in stride(from: 0, to: daysOfWeek.count, by: 1) {
   numDays+=1                                             
}
print(numDays)

// Change one of the days to "Holiday".
daysOfWeek[5] = "Holiday"

// Remove a day of the week you do not like.
daysOfWeek.remove(at: 0)

// Add a day that you would like, call it anything you like.
daysOfWeek.insert("Minh Day", at: 2)

// Print out the list.
print(daysOfWeek)