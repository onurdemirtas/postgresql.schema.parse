# postgresql.schema.parse
First, it exports schema file from PostgreSQL with "pg_dump --schema-only". Then, parses the schema file for separating the each object types into separate folders and each object into a separate file. You can also parse a previously extracted pg_dump file with this script by making minor changes.<br />

The code consists of 3 parts.<br>
1. Extracting the schema file with PostgreSQL / pg_dump<br />
2. Parsing objects to folders and files with the Bash script<br />
3. Archiving all files and converting them into a single file<br />

You can change any of these parts or use any you want.<br />

Detailed Steps;<br>
1. Download postgresql.schema.parse.sh file to any folder of you<br />
![schema folder shell](https://github.com/user-attachments/assets/23750bfa-8da6-465b-912c-b05290185254)<br />
2. Edit database configuration part in the top of the file<br />
![schema shell dbconfig](https://github.com/user-attachments/assets/fed78059-630f-417b-ba81-12ff7edad203)<br />
3. Open a terminal window from the folder<br />
4. Run "bash postgresql.schema.parse.sh"<br />
![schema parse output](https://github.com/user-attachments/assets/b7b1ba3e-ebd3-4f01-9e31-39cb913109e5)<br />
5. You will find a dated tar.gz archive file on the same folder<br />
![schema output archive](https://github.com/user-attachments/assets/3d9e6284-3a4f-4fb7-b560-2d175d39aee3)<br />
6. You can keep this archive file regularly for schema backup<br />
7. Extract this archive to a folder for examine any file in it<br />
![schema folder files](https://github.com/user-attachments/assets/faa1766a-0c53-4027-b58d-cd7d7d356a64)<br />
8. You can compare local and prod schema folders with "Meld" folder compare feature<br />
![schema meld](https://github.com/user-attachments/assets/db907170-7152-4e98-8fd7-c01c1597d6e2)
