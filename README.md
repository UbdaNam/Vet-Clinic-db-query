# Vet-Clinic-database-project

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)

# 📖 Vet Clinic <a name="about-project"></a>

The **Vet Clinic** database project aims to develop a thorough system for controlling clinic operations and vets data. Tables in the database will be used to monitor vet patients data such as name, weight, Dob, and escape attempts. Additionally, tables for scheduling appointments, medical procedures, and prescription drugs will be included.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Add vet clinic schema**
- **Add mock animals data**
- **Contains some queries for testing and future use purpose**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- postgresSQL installed

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone https://github.com/UbdaNam/Vet-Clinic-db-query.git
```

### Install

Install this project with:

```sh
  cd Vet-Clinic-db-query
  psql -U [enter your username here] -h localhost
  password:_"Enter your password"
  CREATE DATABASE vet-clinic;
```

### Usage

To run the project, execute the following command:

- Run commands in schema.sql file first
- Run commands in data.sql to add mock data to your database
- Run commands in queries.sql to test some queries

## 👥 Authors <a name="authors"></a>

👤 **Author1**

- GitHub: [@UbdaNam](https://github.com/UbdaNam)
- LinkedIn: [Abdurahim M.](https://www.linkedin.com/in/abdurahim-miftah/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Query and update animals table**
- [ ] **Query multiple tables**
- [ ] **Database performance audit**
- [ ] **Add database schema diagram**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project consider giving it a star on GitHub! Your help reassures me that this initiative is valuable and appreciated.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank microverse in advance. You helped me to build this project by supporting me and providing requirements.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
