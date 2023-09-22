MSG_FILENAME = "msg.json"

def run(plan, args):
    # we test that this relative import works when primary-package import this package
    plan.upload_files("./" + MSG_FILENAME)
    plan.print("Secondary package loaded.")
    
    msg = get_msg()
    
    return msg

def get_msg():
    msg_json = json.decode(read_file("./" + MSG_FILENAME))

    return msg_json["message"]

def random_msg():
    return "random message"
