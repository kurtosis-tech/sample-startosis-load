MSG_FILENAME = "msg.json"

def run(plan, args):
    plan.upload_files("./" + MSG_FILENAME)
    plan.print("Secondary package loaded.")