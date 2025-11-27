# Follow driver installation and setup instructions here: 
# https://www.oracle.com/database/technologies/appdev/python/quickstartpython.html

import oracledb
# Replace USER_NAME, PASSWORD with your username and password
DB_USER = "USER_NAME"
DB_PASSWORD = "PASSWORD"
# If you want to connect using your wallet, comment out the following line.
CONNECT_STRING = '(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.eu-amsterdam-1.oraclecloud.com))(connect_data=(service_name=ge8ef0247e05788_atpborg3sut_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))'
def run_app():
	try:
		# If THICK mode is needed, uncomment the following line.
		#oracledb.init_oracle_client() 

		# If you want to connect using your wallet, uncomment the following CONNECT_STRING line.
		# dbname - is the TNS alias present in tnsnames.ora dbname
		# CONNECT_STRING = "dbname_medium"
		pool = oracledb.create_pool(
			# If you want to connect using your wallet, uncomment the following line.
			# config_dir="/Users/test/wallet_dbname/",
			user=DB_USER,
			password=DB_PASSWORD,
			dsn=CONNECT_STRING,
			# If THIN mode is needed and your Python version is 3.13 and above, uncomment the following lines.
			# wallet_location="/path/to/your/ewallet.pem",
			# wallet_password="WALLET_PASSWORD"
		)
		with pool.acquire() as connection:
			with connection.cursor() as cursor:
				cursor.execute("SELECT 1 FROM DUAL")
				result = cursor.fetchone()
				if result:
					print(f"Connected successfully! Query result: {result[0]}")
	except oracledb.Error as e:
		print(f"Could not connect to the database - Error occurred: {str(e)}")
	except Exception as e:
		import traceback
		traceback.print_exc()

if __name__ == "__main__":
	run_app()



	*** Settings ***
Library OracleDBLibrary

*** Variables ***
${DB_USER} app_user
${DB_PASSWORD} secret_pass
${DB_DSN} my_tns_entry

*** Test Cases ***
Verify User Display Name
    Oracle Connect username=${DB_USER} password=${DB_PASSWORD} dsn=${DB_DSN}
    
    ${Expected_Name}= Set Variable Alice Johnson
    
    # Call the function and get the VARCHAR2 result
    ${Display_Name}= Call Get User Display Name Function 101

    Log To Console Fetched Display Name: ${Display_Name}
    Should Be Equal ${Display_Name} ${Expected_Name}

    Oracle Connection Close

*** Keywords ***
Call Get User Display Name Function
    [Arguments] ${user_id}
    
    # 1. Define the expected return type as 'string' (equivalent to VARCHAR2)
    ${Return_Type}= Set Variable string
    
    # 2. Call the function
    # - Argument 1: Function name ('get_user_display_name')
    # - Argument 2: Expected return type (${Return_Type} or 'string')
    # - Argument 3: List of IN parameters ([ ${user_id} ])
    ${Full_Name}= Oracle Cursor Callfunc
    ... get_user_display_name
    ... ${Return_Type}
    ... [ ${user_id} ]
    
    [Return] ${Full_Name}



*** Settings ***
Library OracleDBLibrary

*** Variables ***
${DB_USER} app_user
${DB_PASSWORD} secret_pass
${DB_DSN} my_tns_entry
${PRODUCT_NAME} Laptop Xtreme
${CATEGORY_ID} 5
${PRICE} 1250.00
${STOCK} 50

*** Test Cases ***
Register Product Using Named Parameters
    Oracle Connect username=${DB_USER} password=${DB_PASSWORD} dsn=${DB_DSN}
    
    ${New_ID}= Call Register Product Procedure
    
    Log To Console Nieuw product ID: ${New_ID}
    
    # Optioneel: Controleer of het product bestaat met het geretourneerde ID
    Oracle Cursor Execute SELECT name FROM products WHERE product_id = :1
    ... [ ${New_ID} ]
    
    ${Name_Check}= Oracle Cursor Fetchone
    Should Be Equal ${Name_Check}[0] ${PRODUCT_NAME}
    
    Oracle Connection Close

*** Keywords ***
Call Register Product Procedure
    # 1. Maak een variabele voor de OUT parameter
    ${new_id_var}= Oracle Var number

    # 2. Maak een Python dictionary (Named Parameters)
    # De sleutels moeten exact overeenkomen met de parameternamen in de PL/SQL procedure.
    &{Parameters_Dict}= Create Dictionary
    ... p_product_name=${PRODUCT_NAME}
    ... p_category_id=${CATEGORY_ID}
    ... p_price=${PRICE}
    ... p_stock_level=${STOCK}
    ... p_new_product_id=${new_id_var} # De OUT-parameter wordt ook toegevoegd

    # 3. Roep de procedure aan met de dictionary
    # Je hoeft de procedureparameters niet meer in de juiste volgorde te zetten!
    Oracle Cursor Callproc
    ... register_new_product
    ... &{Parameters_Dict} # Gebruik het dictionary-formaat (&{...})

    # 4. Haal de waarde van de OUT parameter op
    ${New_Product_ID}= Oracle Var Getvalue ${new_id_var}
    
    [Return] ${New_Product_ID}