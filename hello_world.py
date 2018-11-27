from flask import Flask

app = Flask(__name__)

def wrap_html(message):
    html = """
        <html>
        <body>
            <div style='text-align:center;font-size:80px;'>
                <image height="340" width="1200" src="https://secure.meetupstatic.com/photos/event/5/b/2/b/600_451883339.jpeg">
                <br>
                {0}<br>
            </div>
        </body>
        </html>""".format(message)
    return html

@app.route('/')

def hello_world():
    message = 'Welcome to CI/CD 101 using CircleCI'
    html = wrap_html(message)
    return html

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)