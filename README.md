# postgresql.schema.parse
First, it exports schema file from PostgreSQL with "pg_dump --schema-only". Then, parses the schema file for separating the each object types into separate folders and each object into a separate file.

1. Download postgresql.schema.parse.sh file to any folder of you<br />
![schema folder shell](https://github.com/user-attachments/assets/23750bfa-8da6-465b-912c-b05290185254)<br />
2. Edit database configuration info on file<br />
![schema shell dbconfig](https://github.com/user-attachments/assets/fed78059-630f-417b-ba81-12ff7edad203)<br />
3. Open a terminal page on this folder<br />
4. run "bash postgresql.schema.parse.sh"<br />
![schema parse output](https://github.com/user-attachments/assets/b7b1ba3e-ebd3-4f01-9e31-39cb913109e5)<br />
5. You will find a dated tar.gz file on the same folder<br />
![schema output archive](https://github.com/user-attachments/assets/3d9e6284-3a4f-4fb7-b560-2d175d39aee3)<br />
6. You may store this archive file for schema backup regularly<br />
7. Extract this archive file to a folder for schema compare with any compare tool like "Meld"<br />
![schema folder files](https://github.com/user-attachments/assets/faa1766a-0c53-4027-b58d-cd7d7d356a64)<br />
8. Folder compare sample with "Meld"<br />
![schema meld](https://github.com/user-attachments/assets/db907170-7152-4e98-8fd7-c01c1597d6e2)
