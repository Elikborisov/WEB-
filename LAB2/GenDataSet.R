library(stringi)

# генерация порядковых номеров
id <- 1:30

# генерация имен и фамилий
first_names <- c("John", "Bob", "Alice", "Jane", "Michael", "William", "Emma", "Olivia", "James")
last_names <- c("Smith", "Johnson", "Brown", "Davis", "Wilson", "Clark", "Thomas", "Jackson", "Taylor")
first_name <- sample(first_names, length(id), replace = TRUE)
last_name <- sample(last_names, length(id), replace = TRUE)
names <- paste(first_name, last_name, sep = " ")

# генерация дат рождения
birth_dates <- sample(seq(as.Date('1970/01/01'), as.Date('1999/12/31'), by="day"), length(id))

# генерация должностей
positions <- c("Manager", "Accountant", "Programmer", "Analyst", "Designer", "Tester", "Administrator")
position <- sample(positions, length(id), replace = TRUE)

# генерация номеров телефонов
phone_numbers <- stri_rand_strings(length(id), 12, pattern = "[0-9]")

# создание датафрейма
data <- data.frame(id, first_name, last_name, birth_dates, position, phone_numbers)

# вывод результатов
print(data)
