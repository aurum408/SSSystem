import os, subprocess
from subprocess import PIPE



def load_page(url, timeout):
    pj = os.environ.get("PROJECT_DIR")
    cmd = "phantomjs ${}/js_scripts/load_page.js --url={} --timeout={}".format(pj, url, timeout)
    p = subprocess.Popen([cmd], stdout=PIPE, stderr=PIPE)


if __name__ == '__main__':
    url = "https://www.amazon.com/s?i=arts-crafts-intl-ship&bbn=4954955011&rh=n%3A4954955011%2Cn%3A12896081%2Cn%3A12896121&dc&qid=1627957907&rnid=12896081"
    script = "/Users/anastasia/PycharmProjects/SSSystem/js_scripts/load_page.js"
    myenv = os.environ.copy()
    myenv["PATH"]=myenv["PATH"] + ":{}/phantomjs-2.1.1-macosx/bin/phantomjs".format(myenv["HOME"])
    myenv["phantomjs"] = "{}/phantomjs-2.1.1-macosx/bin/phantomjs".format(myenv["HOME"])
    os.environ["PATH"] = os.getenv("PATH")+":{}/phantomjs-2.1.1-macosx/bin/phantomjs".format(os.getenv("HOME"))
    # os.system("/Users/anastasia/phantomjs-2.1.1-macosx/bin/phantomjs {}".format(script))

    p = subprocess.Popen(["/Users/anastasia/phantomjs-2.1.1-macosx/bin/phantomjs {}".format(script)],
                         shell=True, env=myenv, stdout=PIPE, stderr=PIPE)
    # stdout = p.stdout

    out = b""
    for line in iter(p.stdout.readline, b''):
        out += line.rstrip()
        p.stdout.flush()

    #p = subprocess.Popen(["phantomjs", script, "--url={}".format(url)], shell=True)
    # p.wait()
    # out = p.stdout

    with open("/Users/anastasia/PycharmProjects/SSSystem/test_new3.html", "w") as fp:
        fp.write(out.decode())

    print("ok")