from flask import Flask

app = Flask(__name__)

def generate_html(message):
    html = """
        <html>
        <body>
            <div style='text-align:center;font-size:80px;'>
                <image height="340" width="1200" src="https://user-images.githubusercontent.com/194400/41597205-a57442ea-73c4-11e8-9591-61f5c83c7e66.png">
                <br>
                {0}<br>
            </div>
        </body>
        </html>""".format(message)
    return html

def greet():
    greeting = 'Welcome to CI/CD 101 using CircleCI!'
    return greeting

@app.route('/')

def hello_world():
    html = generate_html(greet())
    return html

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)