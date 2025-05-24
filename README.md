## JDBC MySQL Practice Lessons

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![JDBC](https://img.shields.io/badge/JDBC-3776AB?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![TestNG](https://img.shields.io/badge/TestNG-FF6C37?style=for-the-badge)

A hands-on learning lab to master **JDBC** and SQL querying skills using the Sakila sample database.

> 📌 SQL scripts are included for reference and **should be executed in tools like DBeaver or MySQL Workbench** — not from IntelliJ.

---

### What You Will Learn

- How to connect to MySQL databases using JDBC
- Execute SQL queries and navigate results with Java
- Use scrollable `ResultSet` features
- Validate data with **TestNG** assertions
- Structure DB test flows professionally

---

### Tech Stack

- **Java 21**
- **JDBC** (MySQL Connector)
- **TestNG 7.10+**
- **Maven**
- **MySQL (Sakila)**

---

### Project Structure

```
jdbc-mysql-practice-lessons/
├── src/
│   └── test/
│       └── java/
│           ├── jdbc/
│           │   ├── JDBCParent.java
│           │   ├── JDBCPractices01.java
│           │   ├── JDBCPractices02.java
│           │   ├── JDBCSakilaCustomerAddAndVerifyExample.java
│           │   └── JDBCSakilaTask.java
│           │
│           └── mysql-sakila-db-practice-notes/
│               ├── MySQL_SakilaDB_Mentoring_01.sql
│               ├── MySQL_SakilaDB_Mentoring_02.sql
│               └── MySQL_SakilaDB_Mentoring_03.sql
├── pom.xml
└── README.md
```

---

### Getting Started

```bash
# Clone the repository
git clone https://github.com/cihat-kose/jdbc-mysql-sakila-db-practice-notes-practice-lessons.git
cd jdbc-mysql-sakila-db-practice-notes-practice-lessons

# Build the project
mvn clean install

# Run all tests
mvn test
```

---

### About the SQL Files

The `.sql` scripts in this repo are for learning purposes only:

- Based on the **Sakila** sample DB
- Practice topics include:
    - Filtering, sorting, joins
    - Aggregation, grouping, DDL & DML
    - Query navigation & performance
- Execute them in tools like **MySQL Workbench**, **DBeaver**, or **DataGrip**

---

### Who Should Use This?

This repo is a great fit if you're:

- A QA Engineer learning database testing
- A SDET student preparing for real-life test scenarios
- A Java developer exploring JDBC deeper
- A bootcamp attendee reviewing SQL basics

---

### Maintained by

**[cihatkose](https://github.com/cihat-kose)**  
Creating dev tools and educational resources for future engineers.

---

### License

This project is licensed under the [MIT License](LICENSE).

---
