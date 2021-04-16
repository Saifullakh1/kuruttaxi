def decorator_function(dect):

    def wrapper_function():
        print("Я все сделал!")

    dect()
    return wrapper_function
 
@decorator_function
def function():
    print("Я декоратор")
 
function()








