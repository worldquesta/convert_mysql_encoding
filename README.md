# convert_mysql_encoding.sh
## _Convert MySQL Encoding_
## How to
Clone  **convert_mysql_encoding**:

> git clone git@github.com:worldquesta/convert_mysql_encoding.git


Use script:
```sh
cd convert_mysql_encoding
chmod 755 convert_mysql_encoding.sh
./convert_mysql_encoding.sh bd_name.sql utf8mb4_unicode_ci utf8mb4
```

 - First  PARAM: Name BD
 - Second PARAM: COLLATE for set in BD
 - Third  PARAM: CHARSET for set in BD

**That's all!**
