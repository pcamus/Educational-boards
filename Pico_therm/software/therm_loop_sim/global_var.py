# file global_var.py
# Using global variables in functions
# author philippe.camus@hepl.be 
# date 4/10/2022

my_global_var = 0

def test_global():
    global my_global_var  # indicate that the my_global_var variable defined outside
                          # the function must be used inside the function.
    my_global_var = my_global_var+1
    
test_global()
print(my_global_var)


    
