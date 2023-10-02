dependency = import_module("github.com/kurtosis-tech/sample-dependency-package/main.star")

EXPECTED_MSG_FROM_MAIN = "dependency-loaded-from-main"
EXPECTED_MSG_FROM_BRANCH = "dependency-loaded-from-another-message-branch"

def run(plan, load_msg_from_main=True):
    plan.print("Sample package loaded.")
    plan.print(load_msg_from_main)

    msg_from_dependency = dependency.get_msg()

    if (load_msg_from_main):
        expected_msg = EXPECTED_MSG_FROM_MAIN
    else:
        expected_msg = EXPECTED_MSG_FROM_BRANCH


    plan.verify(
        value = expected_msg,
        assertion = "==",
        target_value = msg_from_dependency,
    )    

    return