dependency = import_module("github.com/kurtosis-tech/sample-dependency-package/main.star")

EXPECTED_MSG_FROM_MAIN = "dependency-loaded-from-main"
EXPECTED_MSG_FROM_BRANCH = "dependency-loaded-from-another-message-branch"
EXPECTED_MSG_FROM_ANOTHER_SAMPLE_MAIN = "another-dependency-loaded-from-main"

MSG_ORIGIN_MAIN = "main"
MSG_ORIGIN_BRANCH = "branch"
MSG_ORIGIN_ANOTHER_SAMPLE_MAIN = "another-main"

# expect_msg_from_main should be false to run successfully if the replace directive
# is taked into account
def run(plan, message_origin=MSG_ORIGIN_MAIN):
    plan.print("Sample package loaded.")

    msg_from_dependency = dependency.get_msg()

    if (message_origin == MSG_ORIGIN_MAIN):
        expected_msg = EXPECTED_MSG_FROM_MAIN
    elif (message_origin == MSG_ORIGIN_BRANCH):
        expected_msg = EXPECTED_MSG_FROM_BRANCH
    elif (message_origin == MSG_ORIGIN_ANOTHER_SAMPLE_MAIN):
        expected_msg = EXPECTED_MSG_FROM_ANOTHER_SAMPLE_MAIN
    else:
        expected_msg = ""    

    plan.verify(
        value = expected_msg,
        assertion = "==",
        target_value = msg_from_dependency,
    )    

    return