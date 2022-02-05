# convert_mysql_encoding.sh
## _Convert MySQL Encoding_

### Clone  convert mysql encoding script
```
git clone git@github.com:worldquesta/convert_mysql_encoding.git
```

### Configure script
```sh
cd convert_mysql_encoding
chmod 755 convert_mysql_encoding.sh
```
 - First PARAM: Name BD
 - Second PARAM: COLLATE for set in BD or SHOW
 - Third  PARAM: CHARSET for set in BD

### Prepare
Copy you **bd_name.sql** in to cloned directory

### Show existing Encoding in dump
```
./convert_mysql_encoding.sh bd_name.sql SHOW
```
Output:
> CHARACTER SET latin1 <br />
> CHARACTER SET utf8 <br />
> CHARSET=latin1 <br />
> CHARSET=utf8 <br />
> CHARSET=utf8mb4 <br />
> COLLATE latin1_swedish_ci <br />
> COLLATE utf8_general_ci <br />
> COLLATE=utf8mb4_0900_ai_ci <br />
> COLLATE utf8_unicode_ci <br />
> COLLATE=utf8_unicode_ci <br />
> SET NAMES utf8mb4 <br />

####Converting BD
```
 ./convert_mysql_encoding.sh name_bd.sql sql utf8mb4_unicode_ci utf8mb4
```
Output:
> BD 'mir_kvestov_ru_for_dev.sql' founded. Start converting proccess..  <br />
>  <br />
> YOU CAN USE: /CHARACTER SET latin1 / s//CHARACTER SET utf8 /g <br />
> YOU CAN USE: /CHARACTER SET utf8 / s//CHARACTER SET utf8 /g <br />
> YOU CAN USE: /CHARSET=latin1;/ s//CHARSET=utf8;/g <br />
> ... <br />
> YOU CAN USE: /COLLATE utf8_unicode_ci / s//COLLATE utf8_unicode_ci /g <br />
> YOU CAN USE: /COLLATE utf8_unicode_ci,/ s//COLLATE utf8_unicode_ci,/g <br />
> YOU CAN USE: /COLLATE=utf8_unicode_ci;/ s//COLLATE=utf8_unicode_ci;/g <br />
> YOU CAN USE: /SET NAMES utf8mb4 / s//SET NAMES utf8 /g <br />
> ... <br />
> Done converting proccess. <br />

Output after:
> CHARACTER SET utf8mb4 <br />
> CHARSET=utf8mb4 <br />
> COLLATE utf8mb4_unicode_ci <br />
> COLLATE=utf8mb4_unicode_ci <br />
> SET NAMES utf8mb4 <br />

**That's all!**
