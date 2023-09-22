# We import this sibling module just to validate that the relative import inside the secondary-package 
# does not break when it's imported from a sibling package
sibling_module = import_module("github.com/kurtosis-tech/sample-startosis-load/secondary-package/main.star")

def run(plan, args):
    plan.print("Primary package loaded.")

    msg_from_sibling = sibling_module.get_msg()
    msg_to_return = "Message from secondary package: '{0}'".format(msg_from_sibling)

    return msg_to_return
