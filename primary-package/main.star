# We import this sibling module just to validate that the relative import inside the secondary-package 
# does not break when it's imported from a sibling package
sibling_module = import_module("github.com/kurtosis-tech/sample-startosis-load/secondary-package/main.star")

def run(plan, args):
    plan.print("Primary package loaded.")

    msg_to_return = sibling_module.random_msg()

    return msg_to_return

