# INSTALLATION:
sh setup.sh
sh test.sh

# RESULTS:
## 100 rows

    Execution time mysql 5.7: 0.201152 seconds
    Execution time mysql 5.7, sort By ID: 0.200334 seconds
    Execution time mysql 5.5: 0.194087 seconds
    Execution time mysql 5.7, sort By ID: 0.220119 seconds
    Execution time Postgres 14: 0.420111 seconds
    Execution time Postgres 14, sort By ID: 0.216411 seconds
    Execution time Postgres 14: 0.403078 seconds
    Execution time Postgres 14, sort By ID: 0.214523 seconds 

## 1000000 rows

    Execution time mysql 5.7: 0.206666 seconds 
    Execution time mysql 5.7, sort By ID: 0.222569 seconds 
    Execution time mysql 5.5: 0.201978 seconds 
    Execution time mysql 5.7, sort By ID: 0.208511 seconds 
    Execution time Postgres 14: 37.397662 seconds 
    Execution time Postgres 14, sort By ID: 0.254235 seconds 
    Execution time Postgres 14: 33.905904 seconds 
    Execution time Postgres 14, sort By ID: 0.243058 seconds 