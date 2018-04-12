
from flask import Flask, request, render_template, g
import mysql.connector

app = Flask(__name__)
app.config["DATABASE_USER"] = "root"
app.config["DATABASE_PASSWORD"] = "root"
app.config["DATABASE_DB"] = "dat310_assignment8"
app.config["DATABASE_HOST"] = "localhost"
app.debug = True



def get_db():
    if not hasattr(g, '_database'):
        g._database = mysql.connector.connect(host=app.config["DATABASE_HOST"], user=app.config["DATABASE_USER"],
                                       password=app.config["DATABASE_PASSWORD"], database=app.config["DATABASE_DB"])
    return g._database


@app.route("/property/<int:property_id>")
def property(property_id):
    return render_template("property.html", property=get_properties(property_id))

def get_properties(property_id):
    db = get_db()
    cur = db.cursor()
    sql = 'SELECT name, location, description, details, photo FROM properties WHERE ID=%s'
    cur.execute(sql, (property_id,))
    (name, location, description, details, photo) = cur.fetchone()
    PROPERTY = {
        'ID': property_id,
        'name': name,
        'location': location,
        'description': description,
        'details': details,
        'photo': photo
    }
    return PROPERTY


@app.route("/book", methods=["POST"])
def book():
    action = request.form.get("action")

    COUNTRIES = {
        'NO': 'Norway',
        'SE': 'Sweden',
        'DK': 'Denmark',
        '--': 'Other'
    }

    if action == "do_1":
        # TODO: check booking details, if all correct show confirmation form,
        # otherwise show order form again (with filled-in values remembered)

        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        street = request.form.get('street')
        city = request.form.get('city')
        postcode = request.form.get('postcode')
        country = COUNTRIES[request.form.get('country')]
        comment = request.form.get('comment')
        date_from = request.form.get('checkin')
        date_to = request.form.get('checkout')

        return render_template("booking_2.html", property=get_properties(request.form.get('property_id')), name=name, email=email, phone=phone,
                               street=street, city=city, postcode=postcode, country=country, comment=comment, date_from=date_from, date_to=date_to)
    elif action == "do_2":
        if request.form.get("confirm") == "1":  # check if booking is confirmed
            # TODO: save booking in database and return confirmation number

            property_id = request.form.get('property_id')
            name = request.form.get('name')
            email = request.form.get('email')
            phone = request.form.get('phone')
            street = request.form.get('street')
            city = request.form.get('city')
            postcode = request.form.get('postcode')
            country = request.form.get('country')
            comment = request.form.get('comment')
            date_from = request.form.get('checkin')
            date_to = request.form.get('checkout')

            db = get_db()
            cur = db.cursor()
            sql = "INSERT INTO orders (property_ID, checkin, checkout, name, email, phone, street, city, postcode, country, comment) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

            cur.execute(sql, (property_id, date_from, date_to, name, email, phone, street, city, postcode, country, comment))
            db.commit()

            sql = "SELECT ID FROM orders WHERE property_ID=%s"
            cur.execute(sql, (property_id, ))
            ID = cur.fetchone()

            cur.close()

            return render_template("booking_3.html", property=get_properties(request.form.get('property_id')), booking_id=ID)
        else:
            return render_template("booking_2.html", property=get_properties(request.form.get('property_id')), err="You need to confirm the booking.")
    else:
        date_from = request.form.get('checkin')
        date_to = request.form.get('checkout')
        return render_template("booking_1.html", property=get_properties(request.form.get('property_id')), date_from=date_from, date_to=date_to)


@app.teardown_appcontext
def teardown_db(feil):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()



@app.route("/termsconditions")
def termsconditions():
    return render_template('termsconditions.html')

@app.route("/")
def index():
    db = get_db()
    cur = db.cursor()

    PROPERTIES = []
    sql = 'SELECT ID, name, location, description, details, photo FROM properties'
    cur.execute(sql)
    for (ID, name, location, description, details, photo) in cur:
        PROPERTIES.append({
            'ID': ID,
            'nsme': name,
            'location': location,
            'description': description,
            'details': details,
            'photo': photo
        })

    return render_template("index.html", properties=PROPERTIES)

if __name__ == "__main__":
    app.run()
